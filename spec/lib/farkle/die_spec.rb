describe Farkle::Die do 

  let(:die) { Farkle::Die.new }

  it 'can be created' do 
    expect(die).to be_instance_of Farkle::Die
  end

  context 'when given nil argument' do 
    it 'can be created' do 
      die = Farkle::Die.new(nil)
      expect(die).to be_instance_of Farkle::Die
    end

    it 'has six sides' do 
      die = Farkle::Die.new(nil)
      expect(die.sides).to be 6
    end
  end

  context 'when given an integer argument n' do 
    it 'has n sides' do 
      die = Farkle::Die.new(14)
      expect(die.sides).to be 14
    end
  end

  describe '#roll' do 
    it 'has a value between 1,6' do 
      expect(die.roll).to be_between(1,6).inclusive
    end

    it 'sets the upface to the roll value' do 
      value = die.roll
      expect(die.upface).to be value
    end
  end

  describe '#rolled?' do 
    context "hasn't been rolled" do 
      it 'returns false' do 
        die = Farkle::Die.new
        expect(die.rolled?).to be false
      end
    end

    context "has been rolled" do
      it 'returns true' do 
        die = Farkle::Die.new
        die.roll
        expect(die.rolled?).to be true
      end
    end
  end

end
