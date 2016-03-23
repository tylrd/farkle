describe Farkle::Scoring do 

  let(:game) {TestHelpers::Game.new}
  
  describe '#one_or_five?' do 
    context 'no one or fives' do 
      it 'returns false' do 
        game.dice = create_dice(2,3,4,6,6,2)
        expect(game.one_or_five?).to be false
      end
    end

    context 'given a one and no fives' do 
      it 'returns true' do 
        game.dice = create_dice(1,2,3,2,4,3)
        expect(game.one_or_five?).to be true
      end
    end

    context 'given a five and no ones' do 
      it 'returns true' do 
        game.dice = create_dice(5,4,3,2,6)
        expect(game.one_or_five?).to be true
      end
    end

    context 'given a one and a five' do 
      it 'returns true' do 
        game.dice = create_dice(1,5,3,2,1,5)
        expect(game.one_or_five?).to be true
      end
    end
  end

  ["three", "four", "five", "six"].each_with_index do |num, index|
    describe "##{num}_of_a_kind" do 
      context "does not have #{num} of a kind" do 
        it "returns false" do 
          game.dice = create_dice(1,3,4,2,1,5)
          expect(game.send("#{num}_of_a_kind")).to eq []
        end
      end

      context "has #{num} of a kind" do 
        it "returns true" do 
          pairs = index + 3
          remainder = 6 - pairs

          array = Array.new(pairs) { 4 }
          array += (1..remainder).to_a

          game.dice = create_dice(*array)
          expect(game.send("#{num}_of_a_kind")).to eq [4]
        end
      end
    end
  end

end
