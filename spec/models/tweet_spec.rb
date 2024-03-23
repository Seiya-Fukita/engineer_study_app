require "rails_helper"

RSpec.describe Tweet, type: :model do
  context "factoryデフォルト設定で作成した場合" do
    let(:tweet) { create(:tweet) }

    it "userを正常に作成できる" do
      expect(tweet).to be_valid
    end
  end

  describe "バリデーション" do
    let(:tweet) { build(:tweet, content: content) }

    context "内容が140字以内の場合" do
      let(:content) { "TEST" }

      it "正常に作成できる" do
        expect(tweet).to be_valid
      end
    end

    context "内容が140字より大きい場合" do
      let(:content) { "a" * 141 }
      it "エラーメッセージが返る" do
        expect(tweet).to be_invalid
        expect(tweet.errors.full_messages).to eq ["内容は140文字以内で入力してください"]
      end
    end

    context "内容が空の場合" do
      let(:content) { "" }
      it "エラーメッセージが返る" do
        expect(tweet).to be_invalid
        expect(tweet.errors.full_messages).to eq ["内容を入力してください"]
      end
    end
  end
end
