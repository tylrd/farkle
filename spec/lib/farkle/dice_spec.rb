describe Farkle::Dice do 

  let(:dice) {Farkle::Dice.new}

  it 'can be created' do 
    expect(dice).to be_instance_of Farkle::Dice
  end

  it 'responds to enumerable methods' do 
    expect(dice).to respond_to :each
    expect(dice).to respond_to :select
  end

  context 'initialize with an num argument' do 
    it 'should have n dice' do 
      dice = Farkle::Dice.new(num: 20)
      expect(dice.size).to be 20
    end
  end

  context 'initialize with no arguments' do 
    it 'should have six dice' do 
      dice = Farkle::Dice.new
      expect(dice.size).to be 6
    end
  end

  context 'initialize with two arguments' do 

    let (:dice) { Farkle::Dice.new(num: 20, sides: 14) }

    it 'should have n dice' do 
      expect(dice.size).to be 20
    end

    it 'should have dice with n sides' do 
      expect(dice.first.sides).to be 14
    end

  end

  describe '#throw' do 
    it 'returns an array' do 
      expect(dice.throw).to be_instance_of Array
    end

    it 'returns an array of die' do 
      roll = dice.throw
      expect(roll.first).to be_instance_of Farkle::Die
    end
  end

  describe '#thrown?' do 
    context 'die have not been thrown' do 
      it 'returns false' do 
        dice = Farkle::Dice.new
        expect(dice.thrown?).to be false
      end
    end

    context 'die have been thrown' do 
      it 'returns true' do 
        dice = Farkle::Dice.new
        dice.throw
        expect(dice.thrown?).to be true
      end
    end
  end

end
