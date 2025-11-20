#!/bin/bash

# Variable para consultar la base de datos (Importante: -t y --no-align para obtener datos limpios)
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generar número aleatorio entre 1 y 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Preguntar nombre de usuario
echo "Enter your username:"
read USERNAME

# Consultar si el usuario existe
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# Si el usuario no existe (USER_ID está vacío)
if [[ -z $USER_ID ]]
then
  # Mensaje de bienvenida para usuario nuevo
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  # Insertar nuevo usuario en la base de datos
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  
  # Obtener el user_id recién creado
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

else
  # Si el usuario existe, obtener estadísticas
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  
  # Mensaje de bienvenida para usuario recurrente
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Iniciar el juego
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

# Bucle del juego
while read GUESS
do
  # Aumentar contador de intentos (cada vez que entra un input)
  ((GUESS_COUNT++))

  # 1. Verificar si es un número entero
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    # Restamos el intento porque no fue válido (opcional, pero usualmente en estos tests el input inválido no cuenta como intento de juego lógico, aunque el script debe seguir pidiendo input)
    # Nota: Para este desafío específico, simplemente pedimos input de nuevo.
  
  # 2. Verificar si es el número correcto
  elif [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    break; # Salir del bucle

  # 3. Verificar si es mayor
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  
  # 4. Verificar si es menor
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
done

# Insertar el resultado del juego en la base de datos
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)")

# Mensaje final de éxito
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
# fix: mayor change
