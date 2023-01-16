const baseUrl = `${location.protocol}//${location.host}`;
// const fiber = new Fiber(baseUrl);
const token = document.querySelector(".jtl_token").value;

const popUpContainer = document.querySelector(".pop-up-container.translation");
const popUpContent = document.querySelector(".pop-up-content.translation");
const popUpIcon = document.querySelector(".pop-up-icon.translation");
const popUpMessage = document.querySelector(".pop-up-message.translation");
const popUpConfirm = document.querySelector(
    "#confirm-pop-up-screen.translation"
);

const popUpClose = document.querySelector(".dismiss-popup.translation");
popUpClose.addEventListener("click", () => {
    popUpContainer.classList.remove("active");
    popUpContent.classList.remove("active");
});

// fiber.set_headers({
//   "Content-lang": "en",
//   Accept: "application/json",
//   "Jtl-Token": token,
// });

// const trans_data = new FormData();
// trans_data.set("io", "request");
// trans_data.set("jtl_token", token);

const trans_data = new FormData();
trans_data.ready();
// trans_data.append("jtl_token", token);

let setKeyObject = new FormData();
setKeyObject.ready();
// setKeyObject.append("jtl_token", token);

const translationForm = document.getElementById("translation-key");
const chooseLanguage = document.getElementById("chooseLanguage");

chooseLanguage.addEventListener("change", async () => {
    if (chooseLanguage.value !== "") {
        removeDomElement("langChild");

        trans_data.append("language", chooseLanguage.value);
        setKeyObject.append("language", chooseLanguage.value);
        try {
            // const response = await fiber.post("/admin/io.php/translate", trans_data);

            let response = await axios.post(`${BASE_URL}/translate`, trans_data);

            if (response.status === 200) {
                let keys = response.data.translate;

                drawSelect(keys, "drawCategories");
            } else {
                popUpIcon.src = `${baseUrl}/mediafiles/Resources/alerts/exclamation-mark.svg`;
                popUpMessage.textContent = "server error";

                popUpContainer.classList.add("active");
                popUpContent.classList.add("active");
            }
        } catch (error) {
            popUpContainer.classList.add("active");
            popUpContent.classList.add("active");
        }
    }
});

function drawSelect(keys, target) {
    let div = document.createElement("div");

    if (target === "drawCategories") {
        div.setAttribute("id", "chooseCategoriesDiv");
    } else if (target === "drawKey") {
        div.setAttribute("id", "chooseKeyDiv");
    }

    let label = document.createElement("label");
    label.textContent =
        target === "drawCategories" ? "Choose Categories" : "Choose Key";
    div.appendChild(label);

    let select = document.createElement("select");
    select.setAttribute(
        "id",
        target === "drawCategories" ? "chooseCategories" : "chooseKey"
    );
    select.setAttribute("name", "key");
    let firstOption = document.createElement("option");
    firstOption.setAttribute("value", "");
    firstOption.setAttribute("selected", "true");
    firstOption.setAttribute("disabled", "true");
    firstOption.textContent =
        target === "drawCategories" ? "choose Categories" : "Choose Key";
    select.appendChild(firstOption);

    for (const key in keys) {
        let option = document.createElement("option");
        option.setAttribute("value", key);
        option.textContent = key;
        select.appendChild(option);
    }

    div.appendChild(select);
    translationForm.appendChild(div);

    if (target === "drawCategories") {
        let chooseCategories = document.getElementById("chooseCategories");
        chooseCategories.addEventListener("change", () => {
            if (chooseCategories.value !== "") {
                removeDomElement("categoriesChild");

                setKeyObject.append("categories", chooseCategories.value);

                drawSelect(keys[chooseCategories.value], "drawKey");
            }
        });
    } else if (target === "drawKey") {
        let chooseKey = document.getElementById("chooseKey");
        chooseKey.addEventListener("change", () => {
            if (chooseKey.value !== "") {
                removeDomElement("keyChild");

                setKeyObject.append("key", chooseKey.value);

                drawInput(keys[chooseKey.value]);
            }
        });
    }
}

function drawInput(value) {
    let div = document.createElement("div");
    div.setAttribute("id", "keyValue");

    let label = document.createElement("label");
    label.textContent = "Set Key Value";
    div.appendChild(label);

    let input = document.createElement("input");
    input.setAttribute("id", "newkeyValue");
    input.setAttribute("value", value);
    input.setAttribute("required", true);
    input.setAttribute("placeholder", "Set Key Value");
    input.setAttribute("type", "text");

    div.appendChild(input);
    translationForm.appendChild(div);

    let submit = document.createElement("input");
    submit.setAttribute("id", "submit");
    submit.setAttribute("type", "submit");
    submit.setAttribute("value", "Set New Value");
    translationForm.appendChild(submit);
}

translationForm.addEventListener("submit", async (event) => {
    event.preventDefault();

    let newkeyValue = document.getElementById("newkeyValue");

    if (newkeyValue.value.length > 0) {
        setKeyObject.append("value", newkeyValue.value);

        try {
            // const response = await fiber.post(
            //   "/admin/io.php/set/translate",
            //   setKeyObject
            // );

            let response = await axios.post(`${BASE_URL}/set/translate`, setKeyObject);

            if (response.status === 200) {
                popUpMessage.textContent = "new key value set successfully";

                popUpIcon.src = `${baseUrl}/mediafiles/Resources/alerts/check.svg`;
            } else {
                popUpIcon.src = `${baseUrl}/mediafiles/Resources/alerts/exclamation-mark.svg`;
                popUpMessage.textContent = "server error";
            }

            popUpContainer.classList.add("active");
            popUpContent.classList.add("active");
        } catch (error) {
            popUpIcon.src = `${baseUrl}/mediafiles/Resources/alerts/exclamation-mark.svg`;
            popUpMessage.textContent = "server error";

            popUpContainer.classList.add("active");
            popUpContent.classList.add("active");
        }
    }
});

function removeDomElement(child) {
    if (child === "keyChild") {
    } else if (child === "categoriesChild") {
        let chooseKeyDiv = document.getElementById("chooseKeyDiv");
        chooseKeyDiv?.remove();
    } else if (child === "langChild") {
        const chooseCategoriesDiv = document.getElementById("chooseCategoriesDiv");
        chooseCategoriesDiv?.remove();

        let chooseKeyDiv = document.getElementById("chooseKeyDiv");
        chooseKeyDiv?.remove();
    }

    let keyValue = document.getElementById("keyValue");
    keyValue?.remove();

    let submit = document.getElementById("submit");
    submit?.remove();
}
