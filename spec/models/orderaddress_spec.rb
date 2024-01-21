require 'rails_helper'
RSpec.describe Orderaddress, type: :model do
  before do
  @orderaddress = FactoryBot.build(:orderaddress)
  end

  describe '購入機能' do
    context '購入できる場合' do
      it "購入できる" do
        expect(@orderaddress).to be_valid
      end
    end
    context '購入できない場合' do
      it "tokenが空では登録できないこと" do
        @orderaddress.token = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空では登録できない' do
        @orderaddress.user_id = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では登録できない' do
        @orderaddress.item_id = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Item can't be blank"
      end
      it 'addressが空では登録できない' do
        @orderaddress.address = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Address can't be blank"
      end
      it 'addressが数字だけでは登録できない' do
        @orderaddress.address = "1110000"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include('Address is invalid')
      end
      it 'prefecture_idが1では登録できない' do
        @orderaddress.prefecture_id = '1'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalitiesが空では登録できない' do
        @orderaddress.municipalities = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'street_addressが空では登録できない' do
        @orderaddress.street_address = nil
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Street address can't be blank"
      end
      it 'telephone_numberが空では登録できない' do
        @orderaddress.telephone_number = ""
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Telephone number can't be blank"
      end
      it 'telephone_numberが11文字以上では登録できない' do
        @orderaddress.telephone_number = "000000000000"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include"Telephone number is too long (maximum is 11 characters)"
      end
      it 'telephone_numberが数字以外では登録できない' do
        @orderaddress.telephone_number = "000-000-000"
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include "Telephone number is not a number"
      end
    end
  end
end
