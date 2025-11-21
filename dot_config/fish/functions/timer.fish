function timer --description "timer <amount_minutes>"
  set amount $argv[1]


  echo "Starting timer for $amount minute(s)..."

  for i in (seq 1 ( math "$amount * 6" ))
    sleep 10
    set left (math "$amount * 60 - 10 * $i")

    if test $left -le 0
      echo "Time's up!"
      return
    end

    echo "Time left: $left seconds"
  end
end
