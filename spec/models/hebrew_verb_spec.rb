# encoding: UTF-8
require "spec_helper"
require "helpers/letters_helper_spec"

describe HebrewVerb do
  before { load "#{Rails.root}/db/seeds.rb" }
  describe "infinitive" do
    describe "for roots that end in 'ה'" do
      it "ends in 'וֹת'" do
        root = ["כ", "ג", "ה"]

        allowed_letters = letters.select{|letter| letter[:num_value].in?(1..400)}
        cases = 0
        allowed_letters.each do |first_of_root|
          allowed_letters.each do |second_of_root|
            cases += 1
            root = [first_of_root[:name], second_of_root[:name], "ה"]

            Letter.stub(:create_root_from_letters).and_return(root)
            hebrew_verb_hash = Conjugations::Paal.conjugate_paal(root)

            hebrew_verb_hash[:infinitive][-3..-1].should == "וֹת"
          end
        end
        puts "#{cases} different combinations"
      end
    end
  end
end