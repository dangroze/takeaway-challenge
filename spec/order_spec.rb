require 'order'

RSpec.describe Order do
  let(:subject){ Order.new }
  let(:item){ double :item}
  let(:quantity){double :quantity}

  it 'initializes an empty order list'do
    expect(subject.order_list).to be_empty
  end
  describe '#take_order' do
    it 'takes a dish' do
      expect(subject).to respond_to(:take_order).with(2)
    end
    it 'adds the items to the order_list' do
      expect(subject.take_order(item, quantity)).to eq [{:item => item, :quantity => quantity}]
    end
  end
  describe '#calculate_bill' do
    it 'returns the order total' do
      subject.take_order('pizza', 2)
      expect(subject.calculate_bill).to eq 19.98
    end
  end
  it 'checks for correct total' do
    subject.take_order('pizza', 2)
    expect(subject.correct_total?(19.98)).to eq true
  end
  it 'raises error when bill total is incorrect' do
    subject.take_order('kebab', 3)
    expect { subject.finish_order(10) }.to raise_error "Wrong total!"
  end
  it "should confirm the order" do
    allow(subject).to receive(:finish_order).and_return('SMS confirmation sent')
    subject.take_order('pizza', 2)
    expect(subject.finish_order(19.98)).to eq 'SMS confirmation sent'
  end
end
