# Pruebas unitarias asociadas a la creacion de matrices

require 'matrices.rb'
require 'test/unit'

class Test_Matrices < Test::Unit::TestCase

  def setup
    @m1=Matriz.vector(2,2,[0,1,1,0])
    @m2=Matriz.vector(2,2,[1,1,1,1])
  end
  
  def tear_down
    #nothing
  end
  
  #Comprobacion de la creacion de matrices
  def test_creac
    assert_equal(Matriz.vector(2,2,[1,1,1,1]).to_s,@m2.to_s)
  end
  #Comprobacion de las operaciones 
  def test_op
    assert_equal(Matriz.vector(2,2,[1,2,2,1]).to_s,(@m1+@m2).to_s)
    assert_equal(Matriz.vector(2,2,[1,0,0,1]).to_s,(@m2-@m1).to_s)
    assert_equal(Matriz.vector(2,2,[1,1,1,1]).to_s,(@m1*@m2).to_s)
  end
  
  #test de fallo 
  def test_failure
    assert_equal(Matriz.vector(2,2,[1,1,1,1]).to_s,(@m1+@m2).to_s)
  end
end