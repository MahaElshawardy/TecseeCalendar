const submit_event = document.getElementById("event");
const statusModal = document.getElementById("statusmodal");
const shouldPayButtons = document.querySelectorAll(
  ".custom-button-form button.custom-pay-button"
);

$(document).ready(function () {
  $(".form-control.timepicker").datetimepicker({
    language: "en",
    dateFormat: "d-m-yy",
    timeFormat: "HH:mm:ss",
    minDate: new Date(),
    pickSeconds: true,
    pick12HourFormat: false,
  });
});


submit_event.addEventListener("submit", async (e) => {
  e.preventDefault();
  const titleEN = document.getElementById("titleEN").value;
  const titleDE = document.getElementById("titleDE").value;
  const descriptionEN = document.getElementById("descriptionEN").value;
  const descriptionDE = document.getElementById("descriptionDE").value;
  const fileField = document.getElementById("fileField").files[0];
  const locationEN = document.getElementById("locationEN").value;
  const locationDE = document.getElementById("locationDE").value;
  let eventstartdate = document.getElementById("event-start-date").value;
  let eventenddate = document.getElementById("event-end-date").value;
  const facebook = document.getElementById("facebook").value;
  const twitter = document.getElementById("twitter").value;

  let  checkeventenddate = new Date(eventenddate);
  let checkeventstartdate = new Date(eventstartdate);
  eventstartdate = `${eventstartdate
    .split(" ")[0]
    .split("-")
    .reverse()
    .join("-")} ${eventstartdate.split(" ")[1]}`;

  eventenddate = `${eventenddate
    .split(" ")[0]
    .split("-")
    .reverse()
    .join("-")} ${eventenddate.split(" ")[1]}`;


  async function test() {
    if (checkeventstartdate.getDay() > checkeventenddate.getDay() && checkeventstartdate.getMonth() >= checkeventenddate.getMonth()) {
      let errors = document.querySelectorAll("#checkdate");
      for (i = 0; i < errors.length; i++) {
        errors[i].innerHTML = `
       <h4>Please enter a valid date </h4>
       `;
      }
    } else {
      try {
        const data = new FormData();
        data.ready();
        data.append("titleEN", titleEN);
        data.append("titleDE", titleDE);
        data.append("descriptionEN", descriptionEN);
        data.append("descriptionDE", descriptionDE);
        data.append("fileField", fileField);
        data.append("locationEN", locationEN);
        data.append("locationDE", locationDE);
        data.append("eventstartdate", eventstartdate);
        data.append("eventenddate", eventenddate);
        data.append("facebook", facebook);
        data.append("twitter", twitter);

        let response = await axios.post(`io.php/add/event`, data);
        let modalstatus = document.getElementById("modalstatus");
        statusModal.click();
        modalstatus.innerHTML = `
     <h4> ${response.data.message}</h4>
     <div class="modal-footer">
         <button type="button" onClick="refreshPage()" id="close-add-gift-message" class="btn btn-secondary" data-dismiss="modal">Close</button>
     </div>
     `;
      } catch (error) {
        console.log(error);
      }
    }
  }

  test();
});
