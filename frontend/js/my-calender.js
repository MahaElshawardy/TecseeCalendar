const cancel_calender = document.querySelectorAll("#cancel");

cancel_calender.forEach((button) => {
  button.addEventListener("click", () => {
    let calender_id = cancel_calender.getAttribute('data-status');
  });
});
