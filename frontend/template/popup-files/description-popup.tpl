{block name='method-popup'}
    <div class="pop-up-container popup-confirm-container" id='description-popup-container'>
        <div class="pop-up-content-parent" id="description-popup">
            <div class="pop-up-content popup-confirm-content" id="description-popup-content">
                <i class='dismiss-popup x-icon fa fa-times' id='close-description-popup'></i>


                <img src='{$ShopURL}/mediafiles/Resources/alerts/clock.svg' id="description-popup-image" class='pop-up-icon'
                    style="width: 95px;">

                <div class="appointment-description" id="appointment-description">
                    <label class="time-label" for="reservation-time" id="appointments-label">
                        {if $smarty.session.kSprache === 1}
                            Wählen Sie die Zeit zwischen Ihren Terminen
                        {else}
                            Select Your Appointments Time Between
                        {/if}
                        <span></span>
                    </label>
                    <input type="text" class="form-control timepicker hasWickedpicker" id="reservation-time"
                        name="reservation-time" onkeypress="return false;" aria-showingpicker="true" tabindex="-1"
                        title="{if $smarty.session.kSprache === 1}Uhrensymbol anklicken{else}click clock icon{/if}">
                </div>

                <p id="appointments-error-message"></p>

                <button id="submit-appointment" class="customer-popup-button">
                    {if $smarty.session.kSprache === 1}
                        Einreichen
                    {else}
                        Submit
                    {/if}
                </button>
            </div>
        </div>
    </div>
{/block}