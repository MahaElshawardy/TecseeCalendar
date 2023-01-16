class FormOperation {
  #inputs;
  #rules;
  constructor(form, rules) {
    this.#inputs = [
      ...Array.from(form.querySelectorAll("input")),
      ...Array.from(form.querySelectorAll("select")),
      ...Array.from(form.querySelectorAll("textarea")),
    ];
    this.#rules = rules;
  }
  getRules() {
    return this.#rules;
  }
  validate() {
    const errors = [];
    this.#inputs.forEach((input) => {
      const inputValidation = new InputValidation(input);
      inputValidation.registerConditions(this.#rules[input.name]);
      const inputErrors = inputValidation.validate();
      if (JSON.stringify(inputErrors) != "{}") {
        errors.push({
          element: input,
          ...inputErrors,
        });
      }
    });
    return errors;
  }
  getData(number) {
    const Data = new FormData();
    this.#inputs.forEach((input, index) => {
      const Value = input.value;

      number[index]
        ? Data.append(input.name, Number(Value))
        : Data.append(input.name, Value);
    });
    return Data;
  }
}
