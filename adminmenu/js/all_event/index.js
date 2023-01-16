// ======================= log pagination
const nextLogPage = document.getElementById("next-logs-page");
const prevLogPage = document.getElementById("prev-logs-page");
prevLogPage.style.display = "none";
const allLogTable = document.getElementById("all-logs-data");
const successModal = document.getElementById("editmodal");

let LogsPage,
  totalLogsPage,
  toLogsPage,
  fromLogsPage,
  currentLogsPage = 1;

nextLogPage.addEventListener("click", () => {
  LogsPage = currentLogsPage + 1;
  getLogs(LogsPage);
});

prevLogPage.addEventListener("click", () => {
  LogsPage = currentLogsPage - 1;
  getLogs(LogsPage);
});

async function getLogs(page = 1) {
  allLogTable.innerHTML = "";
  const data = new FormData();
  data.ready();
  data.append("page", page);

  try {
    let allLogs = await axios.post(`io.php/get/event`, data);

    totalLogsPage = allLogs.data.total;
    toLogsPage = allLogs.data.to;
    fromLogsPage = allLogs.data.from;
    currentLogsPage = allLogs.data.current_page;

    if (allLogs.data.data.length > 0) {
      for (const details of allLogs.data.data) {
        let tr = document.createElement("tr");
        tr.setAttribute("class", "text-center");
        let allTd = [];

        for (const [key, value] of Object.entries(details)) {
          let td = document.createElement("td");
          let b = document.createElement("b");

          switch (key) {
            case "title_en":
              td.innerHTML = `
              <b>${value}</b>
              `;
              allTd[0] = td;
              break;

            case "title_de":
              b.textContent = value;
              td.appendChild(b);
              allTd[1] = td;
              break;

            case "description_en":
              b.textContent = value;
              td.appendChild(b);
              allTd[2] = td;
              break;

            case "description_de":
              b.textContent = value;
              td.appendChild(b);
              allTd[3] = td;
              break;

            case "location_en":
              b.textContent = value;
              td.appendChild(b);
              allTd[4] = td;
              break;

            case "location_de":
              b.textContent = value;
              td.appendChild(b);
              allTd[5] = td;
              break;

            case "image":
              td.innerHTML = `
              <img src="/mediafiles/events/${value}" alt="picture" width="100px" height="100px">
              `;
              allTd[6] = td;
              break;

            case "start_time":
              b.textContent = value;
              td.appendChild(b);
              allTd[7] = td;
              break;

            case "end_time":
              b.textContent = value;
              td.appendChild(b);
              allTd[8] = td;
              break;

            case "facebook_url":
              td.innerHTML = `
              <b><a href="${value}">Click Here</a></b>
              `;
              allTd[9] = td;
              break;

            case "twitter_url":
              td.innerHTML = `
              <b><a href="${value}">Click Here</a></b>
              `;
              allTd[10] = td;
              break;

            case "status":
              if (value === "started") {
                td.innerHTML = `
                <select class="form-select" id="updatestatus" statusid="{$event->id}"
                aria-label="Default select example">
                <option selected>${value}</option>
                <option value="cancel">Cancel</option>
                <option value="finished">Finish</option>
            </select>
                `;
              } else if (value === "waiting") {
                td.innerHTML = `
                <select class="form-select" id="updatestatus" statusid="{$event->id}"
                aria-label="Default select example">
                <option selected>${value}</option>
                <option value="cancel">Cancel</option>
                <option value="finished">Finish</option>
                <option value="started">Start</option>
            </select>
                `;
              } else {
                td.innerHTML = `
                <h4>${value}</h4>
               `;
              }

              allTd[11] = td;
              break;
          }
        }
        for (const td of allTd) {
          tr.appendChild(td);
        }

        let tdDelete = document.createElement("td");
        tdDelete.classList.add("td-buttons-container");
        tdDelete.innerHTML = `
          <div>
            <button data-calender=${details.id}  onclick='deleteDescription(${
          details.id
        })' class="btn btn-danger btn-block mx-auto w-fit DeleteCalender">
              <i class="fas fa-trash-alt"></i>
            </button>

            <button data-calender=${
              details.id
            } onclick='openUpdateModel(${JSON.stringify(
          details
        )})' class="btn btn-primary w-fit updateCalender">
                <i class="fas fa-edit"></i>
            </button>
          </div>
        `;
        tr.appendChild(tdDelete);

        allLogTable.appendChild(tr);
      }

      if (page < totalLogsPage) {
        nextLogPage.style.display = "initial";
      } else {
        nextLogPage.style.display = "none";
      }
      if (currentLogsPage === 1) {
        prevLogPage.style.display = "none";
      } else {
        prevLogPage.style.display = "initial";
      }
    } else {
      nextLogPage.style.display = "none";
      if (currentLogsPage === 1) {
        prevLogPage.style.display = "none";
      } else {
        prevLogPage.style.display = "initial";
      }

      allLogTable.innerHTML = `
        <tr>
            <td class='text-center' id='npApiMessage' colspan="13">there is no data here</td>
        </tr>
      `;
    }
  } catch (error) {
    // detailsMessage.click();
    // detailsRequestMessages.textContent = error.response.data.message;
  }
}

//delete button
async function deleteDescription(id) {
  const deleteButton = document.querySelectorAll(".DeleteCalender");
  const data = new FormData();
  data.ready();
  data.append("id", id);

  try {
    let response = await axios.post(`${BASE_URL}/delete/event/${id}`, data);
    let editmodalstatus = document.getElementById("editmodalstatus");
    successModal.click();
    editmodalstatus.innerHTML = `
    <h4> ${response.data.message}</h4>
    <div class="modal-footer">
        <button type="button" onClick="refreshPage()" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div>
    `;
  } catch (error) {
    console.log(error);
  }
}

const EditModalButtton = document.getElementById("imageeditmodal");

updateForm = document.getElementById("update-calender-details");
let giftId;

function updatePromotion() {
  const updateButton = document.querySelectorAll(".updateCalender");

  updateButton.forEach((button) => {
    button.addEventListener("click", async () => {
      giftId = button.getAttribute("data-calender");
      EditModalButtton.click();
    });
  });
}

//open modal
function openUpdateModel(oldData) {
  giftId = oldData;
  EditModalButtton.click();
  if (typeof oldData === "string") {
    oldData = JSON.parse(oldData);
    console.log(oldData);
  }
  const updatetitle = document.getElementById("update-title");
  const updatetitleDu = document.getElementById("update-title-du");
  const updatedescription = document.getElementById("update-Description");
  const updateDescriptionDu = document.getElementById("update-Description-du");
  const updateLocation = document.getElementById("update-Location");
  const updateLocationDu = document.getElementById("update-Location-du");
  const updatefileField = document.getElementById("update-fileField");
  const updateStartDate = document.getElementById("update-start-date");
  const updateEndDate = document.getElementById("update-end-date");
  const updateFacebook = document.getElementById("update-Facebook");
  const updateTwitter = document.getElementById("update-Twitter");

  updatetitle.value = oldData["title_en"];
  updatetitleDu.value = oldData["title_de"];
  updatedescription.value = oldData["description_en"];
  updateDescriptionDu.value = oldData["description_de"];
  updateLocation.value = oldData["location_en"];
  updateLocationDu.value = oldData["location_de"];
  updateStartDate.value = oldData["start_time"];
  updateEndDate.value = oldData["end_time"];
  updateFacebook.value = oldData["facebook_url"];
  updateTwitter.value = oldData["twitter_url"];
  updatefileField.files[0] = oldData["image"];
}

//send updated data
updateForm.addEventListener("submit", async (event) => {
  event.preventDefault()
  const updatetitle = document.getElementById("update-title").value;
  const updatetitleDu = document.getElementById("update-title-du").value;
  const updatedescription = document.getElementById("update-Description").value;
  const updateDescriptionDu = document.getElementById(
    "update-Description-du"
  ).value;
  const updateLocation = document.getElementById("update-Location").value;
  const updateLocationDu = document.getElementById("update-Location-du").value;
  const updatefileField = document.getElementById("update-fileField").files[0];
  let updateStartDate = document.getElementById("update-start-date").value;
  let updateEndDate = document.getElementById("update-end-date").value;
  const updateFacebook = document.getElementById("update-Facebook").value;
  const updateTwitter = document.getElementById("update-Twitter").value;
  const closeupdatedmodal = document.getElementById("close-updated-modal");

  const data = new FormData();

  if (updateEndDate !== giftId["end_time"]) {
    updateEndDate = `${updateEndDate
      .split(" ")[0]
      .split("-")
      .reverse()
      .join("-")} ${updateEndDate.split(" ")[1]}`;
  }

  if (updateStartDate !== giftId["start_time"]) {
    updateStartDate = `${updateStartDate
      .split(" ")[0]
      .split("-")
      .reverse()
      .join("-")} ${updateStartDate.split(" ")[1]}`;
  }

  data.ready();
  data.append("id", giftId.id);
  data.append("title-en", updatetitle);
  data.append("title-du", updatetitleDu);
  data.append("description-en", updatedescription);
  data.append("description-du", updateDescriptionDu);
  data.append("location-en", updateLocation);
  data.append("location-du", updateLocationDu);
  data.append("image", updatefileField);
  data.append("start-date", updateStartDate);
  data.append("end-date", updateEndDate);
  data.append("facebook", updateFacebook);
  data.append("twitter", updateTwitter);

  try {
    let response = await axios.post(
      `${BASE_URL}/update/event/${giftId.id}`,
      data
    );
    let editmodalstatus = document.getElementById("editmodalstatus");
    closeupdatedmodal.click();
    successModal.click();
    editmodalstatus.innerHTML = `
    <h4> ${response.data.message}</h4>
    <div class="modal-footer">
        <button type="button" onClick="refreshPage()" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div>
    `;
  } catch (error) {
    // detailsMessage.click();
    detailsRequestMessages.textContent = error.response.data.message;
    closeupdatedmodal.click();
  }
});

function refreshPage() {
  window.location.reload();
}

let updatestatus = document.querySelectorAll("#updatestatus");

updatestatus.forEach((button) => {
  button.addEventListener("change", async () => {
    let statusvalue = button.value;
    let statusid = button.getAttribute("statusid");
    const data = new FormData();
    data.ready();
    data.append("id", statusid);
    data.append("status", statusvalue);

    try {
      let response =await axios.post(
        `${BASE_URL}/update/status/${statusid}`,
        data
      );
    } catch (error) {
      detailsRequestMessages.textContent = error.response.data.message;
    }
  });
});
