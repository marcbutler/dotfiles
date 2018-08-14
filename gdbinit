# -*- mode: gdb-script -*-

add-auto-load-safe-path .
add-auto-load-safe-path ~

# Load general python extensions.
source ~/dotfiles/marc-gdb.py

# Back trace for specified thread.
define tbt
  set $tcur = $_thread
  thread $arg0
  backtrace
  thread $tcur
end
document tbt
  tbt thread-id
  
  Thread back trace: print stack for specific thread.
end

# Thread backtrace.
define tbt
  set $tcur = $_thread
  thread $arg0
  backtrace
  thread $tcur
end
document tbt
  tbt thread-id
  
  Thread back trace: print stack for specific thread.
end

# Assign a name to a thread.
define name-thread
  set $tcur = $_thread
  thread $arg0
  thread name $arg1
  thread $tcur
end
document nth
  nth thread-id name
  
  Name thread: give a specific thread a name.
end

# Thread info shortcut.
define ith
  info thread
end
document ith
  ith thread-id
  
  Info threads: print thread list.
end
