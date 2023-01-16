// ======================= log pagination
const nextreservationPage = document.getElementById("next-reservation-page");
const prevreservationPage = document.getElementById("prev-reservation-page");
prevreservationPage.style.display = "none";
const allReservationTable = document.getElementById("all-reservation-data");

let ReservationPage,
  totalReservationPage,
  toReservationPage,
  fromReservationPage,
  currentReservationPage = 1;

nextreservationPage.addEventListener("click", () => {
  ReservationPage = currentReservationPage + 1;
  getReservation(ReservationPage);
});

prevreservationPage.addEventListener("click", () => {
  ReservationPage = currentReservationPage - 1;
  getReservation(ReservationPage);
});

async function getReservation(page = 1) {
  allReservationTable.innerHTML = "";
  const data = new FormData();
  data.ready();
  data.append("page", page);

  try {
    let allReservation = await axios.post(`io.php/get/appointment`, data);

    totalReservationPage = allReservation.data.total;
    toReservationPage = allReservation.data.to;
    fromReservationPage = allReservation.data.from;
    currentReservationPage = allReservation.data.current_page;

    if (allReservation.data.data.length > 0) {
      for (const details of allReservation.data.data) {
        let tr = document.createElement("tr");
        tr.setAttribute("class", "text-center");
        let allTd = [];

        for (const [keys, values] of Object.entries(details)) {

          if (keys == "event" || keys == "customer") {
            for (const [key, value] of Object.entries(values)) {
              let td = document.createElement("td");
              let b = document.createElement("b");

              switch (key) {
                case "cVorname":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[0] = td;
                  break;

                case "cMail":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[1] = td;
                  break;

                case "title_en":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[2] = td;
                  break;

                case "title_de":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[3] = td;
                  break;

                case "description_en":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[4] = td;
                  break;

                case "description_de":
                  b.textContent = value;
                  td.appendChild(b);
                  allTd[5] = td;
                  break;

                case "status":
                  b.textContent = details['status'];
                  td.appendChild(b);
                  allTd[6] = td;
                  break;
              }
            }
          }
        }
        for (const td of allTd) {
          tr.appendChild(td);
        }

        allReservationTable.appendChild(tr);
      }

      if (page < totalReservationPage) {
        nextreservationPage.style.display = "initial";
      } else {
        nextreservationPage.style.display = "none";
      }
      if (currentReservationPage === 1) {
        prevreservationPage.style.display = "none";
      } else {
        prevreservationPage.style.display = "initial";
      }
    } else {
      nextreservationPage.style.display = "none";
      if (currentReservationPage === 1) {
        prevreservationPage.style.display = "none";
      } else {
        prevreservationPage.style.display = "initial";
      }

      allReservationTable.innerHTML = `
        <tr>
            <td class='text-center' id='npApiMessage' colspan="13">there is no data here</td>
        </tr>
      `;
    }
  } catch (error) { }
}
