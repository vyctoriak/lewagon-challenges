require "../lib/credit_number"

describe "#valid_credit_card?" do
  it 'returns true for a valid credit card number' do
    expect(valid_credit_card?('4242424242424242')).to be(true)
  end

  it 'returns false for a credit card number with less than 16 digits' do
    expect(valid_credit_card?('424242424242424')).to be(false)
  end

  it 'returns false for a credit card number with more than 16 digits' do
    expect(valid_credit_card?('42424242424242424')).to be(false)
  end

  it 'returns false for an invalid credit card number' do
    expect(valid_credit_card?('4242424242424241')).to be(false)
  end
end
