function date_from_ms --description "date_from_ms <milliseconds>"
  set milliseconds $argv[1]
  set seconds (math "($milliseconds + 500) / 1000")
  set date (date -d @$seconds "+%Y-%m-%d %H:%M:%S")
  set timezone (date -d @$seconds "+%Z")

  echo $date $timezone
end
