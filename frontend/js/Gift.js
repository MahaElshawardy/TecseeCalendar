let token = document.querySelector(".jtl_token").value;
const reservationModal = document.getElementById("reservationButton");
if (location.href.includes("Calendar") || location.href.includes("Kalender")) {
  // start event click
  let allEventClick = document.querySelectorAll(".click-to-show");
  let closeX = document.getElementById("close-x");
  let eventsDescription = document.getElementById("events-description");
  let allDetails = document.getElementById("all-details");
  let allDetailsOldData = allDetails.innerHTML;

  let onlyOnSmallScreen = document.querySelectorAll(".only-on-small-screen");

  let allDetailsInside = document.getElementById("all-details-inside");
  let allDetailsInsideOldData = allDetailsInside.innerHTML;

  let cloneCloseX = document.querySelectorAll(".close-x");

  let clickOnBoxToShow = document.querySelectorAll(".click-on-box-to-show");
  let arrow = document.querySelectorAll(".custom-icon-test");
  // start api resource
  const protocol = location.protocol,
    hostname = location.hostname;
  let basUrl;

  if (location.href.includes("TecseeCalendar")) {
    basUrl = `${protocol}//${hostname}/TecseeCalendar`;
  } else {
    basUrl = `${protocol}//${hostname}/Kalender`;
  }

  // start send request [access rescource from backend]
  async function request(basUrl, route, method, data) {
    const response = await fetch(`${basUrl}?${route}=${data}`, {
      method: method,
      headers: {
        "Content-Type": "application/json",
      },
    });

    return {
      status: response.status,
      data: await response.json(),
    };
  }

  arrow.forEach((e, i) => {
    e.addEventListener("click", () => {
      allData = JSON.parse(e.dataset.event);
      if (window.innerWidth <= 1300) {
        cloneCloseX[i].addEventListener("click", () => {
          onlyOnSmallScreen[i].classList.remove("active");
        });

        if (!!document.querySelector(".only-on-small-screen.active")) {
          document
            .querySelector(".only-on-small-screen.active")
            .classList.remove("active");

          onlyOnSmallScreen[i].classList.add("active");
        } else {
          onlyOnSmallScreen[i].classList.add("active");
        }
      } else {
        if (!!document.querySelector(".click-to-show.active")) {
          document
            .querySelector(".click-to-show.active")
            .classList.remove("active");

          closeX.classList.add("remove-with-show");
        }
        e.classList.add("active");

        closeX.classList.remove("remove-with-show");
        getAllDescription(e);
      }
    });
  });

  // ===================================== for arrow

  allEventClick.forEach((e, i) => {
    e.addEventListener("click", () => {
      if (window.innerWidth <= 1300) {
        allEventClick.forEach((e) => {
          e.classList.remove("fa-greater-than");
        });

        cloneCloseX[i].addEventListener("click", () => {
          onlyOnSmallScreen[i].classList.remove("active");
        });

        if (!!document.querySelector(".only-on-small-screen.active")) {
          document
            .querySelector(".only-on-small-screen.active")
            .classList.remove("active");

          onlyOnSmallScreen[i].classList.add("active");
        } else {
          onlyOnSmallScreen[i].classList.add("active");
        }
      } else {
        if (!!document.querySelector(".click-to-show.active")) {
          document
            .querySelector(".click-to-show.active")
            .classList.remove("active", "fa-less-than");

          closeX.classList.add("remove-with-show");
        }
        e.classList.add("active");
        e.classList.add("fa-less-than");

        closeX.classList.remove("remove-with-show");
        getAllDescription(e);
      }
    });
  });

  closeX.addEventListener("click", () => {
    if (!!document.querySelector(".click-to-show.active")) {
      document
        .querySelector(".click-to-show.active")
        .classList.remove("active", "fa-less-than");

      closeX.classList.add("remove-with-show");

      inCaseOfCloseClick();
    } else {
      inCaseOfCloseClick();
    }
  });

  function inCaseOfCloseClick() {
    let lang = document.getElementsByClassName("all-events");
    lang = lang[0].getAttribute("language-data");
    allDetailsInside.innerHTML = "";
    let noteForUser = document.createElement("p");
    if (lang == 0) {
      noteForUser.textContent = "click on any event to show details";
    } else {
      noteForUser.textContent =
        "Klicken Sie auf ein beliebiges Ereignis, um Details anzuzeigen";
    }
    noteForUser.className = "only-center";
    allDetailsInside.appendChild(noteForUser);
  }

  // ============================================================== start request

  function getAllDescription(e, transelateAndData) {
    let jsonAllData = e.getAttribute("data-event");

    let allData = JSON.parse(jsonAllData);

    allDetailsInside.innerHTML = `
      <img src="${allData.image}" alt="" />

      <h3>${allData.title}</h3>

      <p>${allData.description}</p>

      <ul>
          <li>${"start date"}: ${allData.start_date}</li>
          <li>${"end date"}: ${allData.end_date}</li>
          <li>${"start time"}: ${allData.start_time}</li>
          <li>${"end time"}: ${allData.end_time}</li>
      </ul>

      <div class="more-icons">
          <div><i class="far fa-clock"></i> ${allData.duration}</div>
          <div><a href=""><i class="fas fa-map-marked-alt"></i> ${
            allData.location
          }</a></div>
      </div>
      <div class="container1">
      <button class="btn" id="reservation_button" reservation-id="${
        allData.id
      }" type="submit">Reservation</button>
  </div>
      `;

    pickReservation();
  }

  // ====================================================================== start detect width
  // });
  // end api resource

  // end event click

  window.onresize = () => {
    if (window.innerWidth > 1300) {
      if (!!document.querySelector(".only-on-small-screen.active")) {
        document
          .querySelector(".only-on-small-screen.active")
          .classList.remove("active");
      }

      if (!!document.querySelector(".icons i.fa-angle-down")) {
        document.querySelectorAll(".icons i.fa-angle-down").forEach((e) => {
          e.classList.remove("fa-angle-down");
          e.classList.add("fa-greater-than");
        });
      }

      if (!!document.querySelector(".fa-angle-up")) {
        document.querySelector(".fa-angle-up").classList.add("fa-greater-than");
        document
          .querySelector(".fa-angle-up.fa-greater-than")
          .classList.remove("fa-angle-up");
      }
    } else {
      document.querySelectorAll(".fa-greater-than").forEach((e) => {
        e.classList.add("fa-angle-down");
        e.classList.remove("fa-greater-than");
      });

      if (!!document.querySelector("i.active")) {
        document.querySelector("i.active").classList.remove("active");
      }

      if (!!document.querySelector(".fa-less-than")) {
        document
          .querySelector(".fa-less-than")
          .classList.remove("fa-less-than");
      }
    }
  };

  if (window.innerWidth > 1300) {
    if (!!document.querySelector(".fa-less-than")) {
      document.querySelector(".fa-less-than").classList.add("fa-less-than");
    }
  } else {
    allEventClick.forEach((e) => {
      e.classList.remove("fa-greater-than");
      e.classList.add("fa-angle-down");
    });
  }
}

let reservationid = document.querySelectorAll(".reservation");

reservationid.forEach((button) => {
  button.addEventListener("click", async (event) => {
    let eventId = event.target.getAttribute("reservation-id");
    const formData = new FormData();
    formData.append("id", eventId);
    formData.append("io", "calendar");
    formData.append("token", token);

    try {
      let response = await axios.post(`io.php/store/appointment`, formData);
      let modalstatus = document.getElementById("modalstatus");
      reservationModal.click();
      modalstatus.innerHTML = `
   <h4> ${response.data.message}</h4>
   <div class="modal-footer">
       <button type="button" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
   </div>
   `;
    } catch (error) {
      console.log(error.response.data.message);
      reservationModal.click();
      modalstatus.innerHTML = `
   <h4> ${error.response.data.message}</h4>
   <div class="modal-footer">
       <button type="button" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
   </div>
   `;
    }
  });
});

function pickReservation() {
  let reservation_button = document.getElementById("reservation_button");
  reservation_button.addEventListener("click", async (event) => {
    let eventId = event.target.getAttribute("reservation-id");
    const formData = new FormData();
    formData.append("id", eventId);
    formData.append("io", "calendar");
    formData.append("token", token);
    try {
      let response = await axios.post(`io.php/store/appointment`, formData);
      let modalstatus = document.getElementById("modalstatus");
      reservationModal.click();
      modalstatus.innerHTML = `
   <h4> ${response.data.message}</h4>
   <div class="modal-footer">
       <button type="button" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
   </div>
   `;
    } catch (error) {
      reservationModal.click();
      modalstatus.innerHTML = `
   <h4> ${error.response.data.message}</h4>
   <div class="modal-footer">
       <button type="button " id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
   </div>
   `;
    }
  });
}

const canceled_calender = document.querySelectorAll("#cancel");

canceled_calender.forEach((button) => {
  button.addEventListener("click", async () => {
    let calender_id = button.getAttribute("data-status");
    const formData = new FormData();
    formData.append("status", "cancelled");
    formData.append("id", calender_id);
    formData.append("io", "calendar");
    formData.append("token", token);
    try {
      let response = await axios.post(
        `io.php/update/appointment/${calender_id}`,
        formData
      );
      let modalstatus = document.getElementById("modalstatus");
      reservationModal.click();
      modalstatus.innerHTML = `
   <h4> ${response.data.message}</h4>
   <div class="modal-footer">
       <button type="button" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
   </div>
   `;
      button.parentElement.innerHTML = `
   <h4 style="margin: 15px;
   color: white;"> Canceled </h4>
   `;
    } catch (error) {}
  });
});

const eyeslash = document.querySelectorAll(".fa-eye");
eyeslash.forEach((event) => {
  event.addEventListener("click", () => {
    let closeX = document.getElementById("close-x");
    if (event.className =="fa fa-eye click-to-show custom-icon-test active fa-less-than") 
    {
      event.className = "fa fa-eye-slash";
    } else {
      event.className = "fa fa-eye click-to-show custom-icon-test active";
      closeX.classList.add("remove-with-show");
      let deletecontent = document.getElementById("all-details-inside");
      let lang = document.getElementsByClassName("all-events");
      lang = lang[0].getAttribute("language-data");

      if (lang == 2) {
        deletecontent.innerHTML = `
        <p class="only-center a">Click On Any Event To Show Details</p>
        `;
      } else {
        deletecontent.innerHTML = `
        <p class="only-center a">Klicken Sie auf ein beliebiges Ereignis, um Details anzuzeigen</p>
        `;
      }
    }

    closeX.addEventListener("click", () => {
      closeX.classList.add("remove-with-show");
    });

    closeX.addEventListener("click", () => {
      event.setAttribute("class", "fa fa-eye click-to-show custom-icon-test");
    });
  });
});
