const RULES = {
  required: (element) => {
    return {
      condition: element.value != "" && element.value != 0,
      msg: "This field is required",
    };
  },
  numeric: (element) => {
    return {
      condition: !isNaN(element.value),
      msg: "This field must be numeric",
    };
  },
  positiveNumber: (element) => {
    return {
      condition: Number(element.value) >= 0,
      msg: "This field cannot be negative",
    };
  },
};
const BASE_URL = `${location.protocol}//${location.host}/admin/io.php`;
const TOKEN = document.querySelector(".jtl_token").value;
const loading = document.getElementById("loading");
FormData.prototype.ready = function () {
  this.append("io", "calendar");
  this.append("jtl_token", TOKEN);
};
