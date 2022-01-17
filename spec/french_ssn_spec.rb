require_relative "../french_ssn.rb"

# Vérifier que le SSN est pas une string vide
describe "#french_ssn_info" do
  it "returns 'The number is invalid' when passend an empty string" do
    actual = french_ssn_info("")
    expected = 'The number is invalid'
    expect(actual).to eq(expected)
  end


  it "return 'a man, born in December, 1984 in Seine-Maritime.' when passed '1 84 12 76 451 089 46'" do
      actual = french_ssn_info("1 84 12 76 451 089 46")
      expected = 'a man, born in December, 1984 in Seine-Maritime.'
      expect(actual).to eq(expected)
  end
end
