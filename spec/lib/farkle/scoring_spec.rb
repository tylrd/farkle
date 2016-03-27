describe Farkle::Scoring do 

  let(:game) {TestHelpers::Game.new}
  
  describe '#one_or_five?' do 
    context 'no one or fives' do 
      it 'returns false' do 
        dice = create_dice(2,3,4,6,6,2)
        expect(game.one_or_five? *dice).to be false
      end
    end

    context 'given a one and no fives' do 
      it 'returns true' do 
        dice = create_dice(1,2,3,2,4,3)
        expect(game.one_or_five? *dice).to be true
      end
    end

    context 'given a five and no ones' do 
      it 'returns true' do 
        dice = create_dice(5,4,3,2,6)
        expect(game.one_or_five? *dice).to be true
      end
    end

    context 'given a one and a five' do 
      it 'returns true' do 
        dice = create_dice(1,5,3,2,1,5)
        expect(game.one_or_five? *dice).to be true
      end
    end
  end

  describe '#straight?' do 
    context "did not roll a straight" do 
      it 'returns false' do 
        dice = create_dice(1,2,3,4,5,5)
        expect(game.straight? *dice).to be false
      end
    end

    context "rolled a straight" do 
      context "in sorted order" do 
        it 'returns true' do 
          dice = create_dice(1,2,3,4,5,6)
          expect(game.straight? *dice).to be true
        end
      end

      context "in unsorted order" do 
        it 'returns true' do 
          dice = create_dice(6,3,1,2,4,5)
          expect(game.straight? *dice).to be true
        end
      end
    end
  end

  describe "#four_plus_pair?" do 
    context "not rolled four plus pair" do 
      it "returns false" do 
        game.dice = create_dice(1,2,3,4,2,1)
        expect(game.four_plus_pair?).to be false
      end
    end

    context "rolled four plus pair" do 
      it "returns true" do 
        dice = create_dice(1,1,1,2,2,1)
        expect(game.four_plus_pair? *dice).to be true
      end
    end
  end

  describe "#two_sets_of_three?" do 
    context "not rolled two sets of three" do 
      it "returns false" do 
        dice = create_dice(1,1,1,1,1,1)
        expect(game.two_sets_of_three? *dice).to be false
      end
    end

    context "rolled two sets of three" do 
      it "returns true" do
        dice = create_dice(1,1,1,2,2,2) 
        expect(game.two_sets_of_three? *dice).to be true
      end
    end
  end

  describe "#three_pairs?" do 
    context "not given three pairs" do 
      it "returns false" do 
        dice = create_dice(6,4,2,1,3,4)
        expect(game.three_pairs? *dice).to be false
      end
    end

    context "given three pairs" do 
      it "returns true" do 
        dice = create_dice(1,1,2,2,3,3)
        expect(game.three_pairs? *dice).to be true
      end
    end
  end

  describe "#six_of_a_kind?" do 
    context "not six of a kinds" do 
      it "returns false" do 
        dice = create_dice(1,2,3,2,1,4)
        expect(game.six_of_a_kind?(*dice)).to be false
      end
    end

    context "rolled six of a kind" do 
      it "returns true" do 
        dice = create_dice(1,1,1,1,1,1)
        expect(game.six_of_a_kind?(*dice)).to be true
      end
    end
  end

end
