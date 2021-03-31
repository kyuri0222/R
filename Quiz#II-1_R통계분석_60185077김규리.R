fibolist = function(size){
  if(size <= 2){
    stop("The size should be greater than 2")
  }
  num1 = 1
  num2 = 1
  fibonacci=c(num1,num2)
  count = 2
  repeat{
    if(count <= size){
      count <- count + 1
      fibonacci <- if(count <= 3){
        c(1, 1)
      }else{
        c(fibonacci, num2)
      }
      num1 <- tail(fibonacci, 2)[1]
      num2 <- num1 + num2
    }
      if(count > size) break
  }
  print(fibonacci)
}

#확인해보기
fibolist(5)