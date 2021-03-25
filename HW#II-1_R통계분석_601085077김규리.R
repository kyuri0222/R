stack = function() {
  stack=c()
  stack_size=0
  
  push = function(data) {
    stack <<-c(stack, data)
    stack_size <<- stack_size+1
  }
  
  pop = function(){
    last=stack[length(stack)]
    stack<<-stack[-length(stack)]
    stack_size<<- stack_size-1
    return(last)
  }
  
  size = function(){
    return(stack_size)
  }
  
  empty = function(){
    if(stack_size==0){
      return(T)
    } else {
      return(F)
    }
  }
  
  full = function(){
    if(stack_size==20){
      return(T)
    } else {
      return(F)
    }
  }
  
  return(list(push=push, pop=pop, size=size,empty=empty, full=full))
}



#확인해보기
stack=stack()
stack$push(2)
stack$push(9)
stack$push(7)
stack$pop()
stack$pop()
stack$size()
stack$full()
stack$empty()
