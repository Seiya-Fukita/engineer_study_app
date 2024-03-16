require "rails_helper"

RSpec.describe User, type: :model do
  context "factoryデフォルト設定で作成した場合" do
    let(:user) { create(:user) }

    it "userを正常に作成できる" do
      expect(user).to be_valid
    end
  end

  describe "バリデーション" do
    subject { user.valid? }

    let(:user) { build(:user, name:, identification_name:, email:, birth_date:, website:) }
    let(:name) { Faker::Name.name }
    let(:identification_name) { Faker::Alphanumeric.unique.alpha(number: 10) }
    let(:email) { Faker::Internet.unique.email }
    let(:birth_date) { Faker::Date.birthday }
    let(:website) { "http://example.com" }

    context "名前が空の場合" do
      let(:name) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(user.errors.full_messages).to eq ["名前を入力してください"]
      end
    end

    context "ユーザー名が空の場合" do
      let(:identification_name) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(user.errors.full_messages).to eq ["ユーザー名を入力してください"]
      end
    end

    context "メールアドレスが空の場合" do
      let(:email) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(user.errors.full_messages).to eq ["メールアドレスを入力してください", "メールアドレスは不正な値です"]
      end
    end

    context "生年月日が空の場合" do
      let(:birth_date) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(user.errors.full_messages).to eq ["生年月日を入力してください"]
      end
    end

    context "不正なウェブサイトの場合" do
      let(:website) { "aaa" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(user.errors.full_messages).to eq ["ウェブサイトは不正な値です"]
      end
    end
  end
end
