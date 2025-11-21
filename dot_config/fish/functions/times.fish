function times --description "times <count> <command>"
  set count $argv[1]
  set command $argv[2..-1]

  for i in (seq 1 $argv[1])
    eval $command
  end
end
