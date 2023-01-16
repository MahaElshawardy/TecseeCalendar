window.addEventListener("load", () => {
  const calendarHomeBtn = document.querySelector(".calendar-home"),
    calendarForm = document.querySelector(
      ".tecSee-calendar-licenses-container"
    ),
    calendarOverLay = document.querySelector(".tecSee-calendar-overlay-licenses");
  if (calendarHomeBtn !== null) {
    calendarHomeBtn.addEventListener("click", (event) => {
      event.preventDefault();
      const baseUrl = `${location.protocol}//${location.hostname}/admin`;
      location.href = baseUrl;
    });
  }
  if (calendarForm !== null) {
    calendarForm.addEventListener("submit", async (event) => {
      event.preventDefault();

      const token = document.querySelector(".jtl_token").value;

      let selectedLang =
        document.querySelector(".fa-language").nextSibling.nextSibling
          .innerHTML;
      selectedLang = selectedLang === "English" ? "en" : "de";
      const data = new FormData();
      data.set("io", "calendar");
      data.set("jtl_token", token);

      for (index = 0; index < calendarForm.elements.length; index++) {
        if (calendarForm.elements[index].type !== "submit") {
          if (!!calendarForm.elements[index].value.trim() !== false) {
            data.set(
              calendarForm.elements[index].name,
              calendarForm.elements[index].value
            );
            calendarForm.elements[index].classList.remove("tecSee-invalid");
            calendarForm.elements[index].value = "";
          } else {
            calendarForm.elements[index].classList.add("tecSee-invalid");
          }
        }
      }
      try {
        const response = await axios.post(`${BASE_URL}/licensekey/calendar`, data, {
          headers: {
            "Content-lang": selectedLang,
            Accept: "application/json",
            "Jtl-Token": "Basic " + token,
          },
        });
        if (response.status === 201) {
          calendarOverLay.classList.add("hidden");
        }
      } catch (error) {
        const mes = error.response.data?.message;
        if (error.response.status === 422) {
          calendarForm.children[0].children[1].innerHTML = `<h1>${mes}</h1>`;
        }
      }
    });
  }
});
