import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users--signup"
export default class extends Controller {
  static targets = [
    "name",
    "email",
    "birth_year",
    "submit",
    "error_name",
    "error_email",
    "error_birth_year"
  ]
  nameValidation() {
    const nameInput = this.nameTarget
    const nameError = this.error_nameTarget
    if(nameInput.value === ""){
      nameInput.style.border = "2px solid red"
      nameError.textContent = "ユーザー名を入力してください"
      nameError.style.color = "red"
    }else{
      nameInput.style.border = "2px solid rgb(96 165 250)"
      nameError.textContent = ""
    }
  }

  emailValidation() {
    const emailInput = this.emailTarget
    const emailError = this.error_emailTarget
    const emailRegex = /^[a-zA-Z0-9_+-]+(\.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$/ // 正規表現パターン

    if(emailInput.value === ""){
      emailInput.style.border = "2px solid red"
      emailError.textContent = "メールアドレスを入力してください"
      emailError.style.color = "red"
    }else if(!emailRegex.test(emailInput.value)){
      emailInput.style.border = "2px solid red"
      emailError.textContent = "有効なメールアドレスを入力してください"
      emailError.style.color = "red"
    }else{
      emailInput.style.border = "2px solid rgb(96 165 250)"
      emailError.textContent = ""
    }
  }
  birthYearValidation() {
    const birthYearInput = this.birth_yearTarget
    const bitrhYearError = this.error_birth_yearTarget
    if(birthYearInput.value === ""){
      birthYearInput.style.border = "2px solid red"
      bitrhYearError.textContent = "生年月日を入力してください"
      bitrhYearError.style.color = "red"
    }else{
      birthYearInput.style.border = "2px solid rgb(96 165 250)"
      bitrhYearError.textContent = ""
    }
  }
  validSubmit() {
    const submitBtn = this.submitTarget

    if((this.nameTarget.value !== "") && (this.emailTarget.value !== "")
      && (this.birth_yearTarget.value !== "")){
      if((this.error_nameTarget.textContent === "") && (this.error_emailTarget.textContent === "")
        && (this.error_birth_yearTarget.textContent === "")){
        submitBtn.disabled = false
      }else{
        submitBtn.disabled = true
      }
    }else{
      submitBtn.disabled = true
    }
  }
}
