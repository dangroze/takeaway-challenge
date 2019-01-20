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
end
