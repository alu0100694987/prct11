
class Matriz

  attr_reader :rows, :cols

  def initialize(rows, cols)
    @rows, @cols = rows , cols
  end
       
  def Matriz.vector(rows, cols, ele)
    raise TypeError, 'No se han introducido suficientes valores' unless (ele.length==rows*cols) 
      if (((ele.count(0)*100)/(rows*cols)) >= 60) # Matriz dispersa
        Matriz_dispersa.new(rows,cols,ele)
      else # Matriz densa
        Matriz_densa.new(rows,cols,ele)
      end
  end
  
  def Matriz.nula(rows=1, cols=1)
    aux=Array.new(rows*cols, 0)
    Matriz_dispersa.new(rows, cols, aux)
  end
       
  def to_s  
    cadena = "["
    for i in (0..(@rows-1))
      cadena += "["
      for j in (0..(@cols-1))
        cadena += "#{self[i,j]}"
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
      result=Array.new
      for i in 0...@rows
        for j in 0...@cols
          result << (self[i,j] + other[i,j])
        end 
      end
      Matriz.vector(@rows, @cols, result)
  end
  
  def -(other) 
    raise TypeError, 'Las matrices no son del mismo tamanyo' unless (@rows==other.rows && @cols==other.cols)
      result=Array.new
      for i in 0...@rows
        for j in 0...@cols
          result << (self[i,j] - other[i,j])
        end 
      end
      Matriz.vector(@rows, @cols, result)
  end
  
  def *(other)
    if(other.is_a? Numeric)
      result=Array.new
      for i in 0...@rows
        for j in 0...@cols
          result << (self[i,j]*other)
        end
      end
      return Matriz.vector(@rows,@cols,result)
      
    elsif(other.is_a? Matriz)
      raise TypeError, 'Las matrices dadas no se pueden multiplicar entre si' unless (@cols == other.rows)
      result=Array.new
      for i in 0...@rows
        for j in 0...other.cols
          result << 0
          for k in 0...@cols
            result[(result.length)-1]= (result.last + (self[i,k] * other[k,j]))
          end
        end
      end
    end
    Matriz.vector(@rows,other.cols,result)
  end
  
  def coerce(other)
    [self,other]
  end
  
end
