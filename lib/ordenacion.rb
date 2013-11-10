require "ordenacion/version"

module Ordenacion
  
class Matriz
  
  attr_reader :rows, :cols
  
  private_class_method :new
  
  def initialize(rows, cols, ele)
    @rows, @cols = rows , cols    
    @mat=Array.new(ele)    
  end
  
  def Matriz.random(rows = 1, cols = 1)
    aux=Array.new(rows*cols)
    for i in 0...rows
      for j in 0...cols
        aux[(i*cols)+j] = rand(10)
      end
    end
    new(rows, cols, aux)
  end
  
  def Matriz.vector(rows, cols, ele)
    raise TypeError, 'No se han introducido suficientes valores' unless (ele.length==rows*cols) 
      new(rows, cols, ele)
  end
  
  def Matriz.vacia(rows=1, cols=1)
    aux=Array.new(rows*cols)
    new(rows, cols, aux)
  end
  
  def pos(x,y)
    (x*@cols)+y
  end
  
  def [](x,y)
    @mat[pos(x,y)]
  end
  
  def []=(x,y,value)
    @mat[pos(x,y)] = value
  end 
  
  def to_s  
    cadena = "["
    for i in (0..(@rows-1))
      cadena += "["
      for j in (0..(@cols-1))
        cadena += "#{@mat[pos(i,j)]}"
        if (j < (@cols-1)) 
          cadena += "," 
        end
      end
      cadena += "]"
      if (i < (@rows-1)) 
        cadena += "," 
      end
    end
    cadena += "]"
  end
  
  def +(other) 
    raise TypeError, 'Las matrices no son del mismo tamanyo' unless (@rows==other.rows && @cols==other.cols)
      result=Matriz.vacia(@rows, @cols)
      for i in 0...@rows
        for j in 0...@cols
          result[i,j]= @mat[pos(i,j)] + other[i,j]
        end 
      end
      result
  end
  
  def -(other) 
    raise TypeError, 'Las matrices no son del mismo tamanyo' unless (@rows==other.rows && @cols==other.cols)
      result=Matriz.vacia(@rows, @cols)
      for i in 0...@rows
        for j in 0...@cols
          result[i,j]= @mat[pos(i,j)] - other[i,j]
        end 
      end
      result
  end
  
  def *(other)
    if(other.is_a? Numeric)
      result=Matriz.vacia(@rows, @cols)
      for i in 0...@rows
        for j in 0...@cols
          result[i,j] = @mat[pos(i,j)]*other
        end
      end
      
    elsif(other.is_a? Matriz)
      raise TypeError, 'Las matrices dadas no se pueden multiplicar entre si' unless (@cols == other.rows)
      result=Matriz.vacia(@rows, other.cols)
      for i in 0...@rows
        for j in 0...other.cols
          if (@mat[pos(i,j)].is_a? Fraccion)
            result[i,j]= Fraccion.new(0)
          else
            result[i,j]= 0
          end
          for k in 0...@cols
            result[i,j] += @mat[pos(i,k)] * other[k,j]
          end
        end
      end
    end
    result
  end
  
  def ==(other)
    if (@rows != other.rows || @cols != other.cols)
      return false
    end
    for i in 0...@rows
      for j in 0...@cols
        if (@mat[pos(i,j)] != other[i,j])
          return false
        end
      end
    end
    return true
  end
  
  def coerce(other)
    [self,other]
  end

end # Class Matriz

end # Module Ordenacion
