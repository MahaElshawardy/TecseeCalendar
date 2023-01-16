const BASE_URL = `${location.protocol}//${location.host}/io.php`;
const TOKEN = document.querySelector(".jtl_token").value;
const totalStrong = document.getElementById("total");
const checkTotal = document.getElementById("check-total");
const loading = document.getElementById("loading");
const unsetGift = document.getElementById("unsetGift");
const data = new FormData();
data.append("io", "request");
data.append("jtl_token", TOKEN);
const http = new HttpRequest(BASE_URL);
http.set_headers({
  jtl_token: TOKEN,
});
async function getCategories() {
  const suppliers = await http.post("/get/supplier", data);
  gift.assignConversionFactor(suppliers.data.conversionFactor);
  gift.assignBasicData(suppliers.data);
}

async function getGifts() {
  await getCategories();
  data.append("categories", gift.getCategoris());
  data.append("manufactrurs", gift.getManufactrurs());
  const gifts = await http.post("/get/getGift", data);
  gift.assignGifts(gifts.data);
  return gift.evaluate();
}

async function pushGifts() {
  const gifts = await getGifts();
  data.delete("categories");
  data.delete("manufactrurs");
  data.append("gifts", gifts);
  const response = await http.post("/discount-gift", data);
  gift.assignGiftsToSelect(response.data.giftProducts);
}

async function main() {
  await pushGifts();
  gift.selectedGift(
    async (gift_id, gift_image, gift_totalAfterDiscount, gift_url) => {
      data.append("gift_id", gift_id);
      data.append("gift_image", gift_image);
      data.append("gift_totalAfterDiscount", gift_totalAfterDiscount);
      data.append("gift_url", gift_url);
      try {
        await http.post("/insertGift", data);
        localStorage.setItem("Gift", true);
        window.location.reload();
      } catch (error) {
        console.log(error);
      }
    }
  );
  gift.showGiftsSlider();
  loading.style.display = "none";
}
if (
  window.location.pathname === "/Warenkorb" ||
  window.location.pathname === "/Cart" ||
  totalStrong
) {
  main();
  if (unsetGift) {
    unsetGift.addEventListener("click", async () => {
      try {
        const Auth = new FormData();
        Auth.append("io", "calendar");
        Auth.append("jtl_token", TOKEN);
        unsetGift.innerText = "loading . . .";
        const response = await http.post("/deleteGift", Auth);
        localStorage.removeItem("Gift");
        window.location.reload();
      } catch (error) {
        console.log(error);
      }
    });
  }
}

if (
  window.location.pathname === "/Bestellvorgang" ||
  window.location.pathname === "/Checkout" ||
  (window.location.search === "" && checkTotal)
) {
  loading.style.display = "none";
  const complete = document.getElementById("complete-order-button");
  complete.addEventListener("click", () => {
    localStorage.removeItem("Gift");
  });
}
if (window.location.pathname === " " || window.location.pathname === "/Start" || window.location.pathname === "/Home") {
  async function test() {
    try {
      const selectedlang = document
        .querySelector(".language-dropdown .dropdown-menu a.active")
        .getAttribute("data-iso");
      const Auth = new FormData();
      Auth.append("lang", selectedlang == "ger" ? "de" : "en");
      Auth.append("io", "calendar");
      Auth.append("jtl_token", TOKEN);
      const response = await http.post("/get/plugin-interface", Auth);
      plugin_interface = response.data.interface;
      displayTranslation(plugin_interface);
    } catch (error) {
      console.log(error);
    }
  }

  test();
}
const logOut = document.querySelector(
  ".dropdown-menu a.account-icon-dropdown-logout"
);

logOut?.addEventListener("click", () => {
  localStorage.removeItem("Gift");
});
