class InputValidation {
  #element;
  #conditions = [];
  #inputMessages = [];
  #InputErrors = {};
  constructor(element) {
    this.#element = element;
  }
  registerConditions(rules) {
    this.#conditions = rules.split("&");
  }
  getELement() {
    return this.#element;
  }
  getConditions() {
    return this.#conditions;
  }
  validate() {
    this.#conditions.forEach((condition) => {
      const errMsg = RULES[condition](this.#element)["msg"];
      const errProbability = RULES[condition](this.#element)["condition"];
      if (!errProbability) {
        this.#inputMessages.push(errMsg);
        this.#InputErrors[this.#element.name] = this.#inputMessages;
      }
    });
    return this.#InputErrors;
  }
}
