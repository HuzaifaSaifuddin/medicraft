// Button styled Radio and Checkbox
const buttonPlugin = () => {
  $("input[type='radio']:checked").closest('label').addClass('active');
  $("input[type='checkbox']:checked").closest('label').addClass('active');
}
