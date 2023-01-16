{$jtl_token}
{block name="new-system"}
    <div class="alert alert-danger" id="error-message-system"></div>
    <div class="card-single">
        <div class="card-header">
            <span class="subheading1">Detail Reservations</span>
            <hr class="mb-n3" />
        </div>
        <div class="card-body p-0">
            <div class="tecSee-table-parent">
                <div class="tecSee-table-container">
                    <div class="tecSee-remove-padding mb-3">
                        <div class="button-Parent-container">
                            <button id="prev-reservation-page">
                                {if $smarty.session.kSprache === 1}
                                    Prev
                                {else}
                                    Prev
                                {/if}
                            </button>
                            <button id="next-reservation-page">
                                {if $smarty.session.kSprache === 1}
                                    Weiter
                                {else}
                                    Next
                                {/if}
                            </button>
                        </div>

                        <table class="table table-striped table-align-top tecSee-table">
                            <thead>
                                <tr>
                                    <th class="text-center">Customer Name</th>
                                    <th class="text-center">Customer Email</th>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Titel</th>
                                    <th class="text-center">Description</th>
                                    <th class="text-center">Beschreibung</th>
                                    <th class="text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody id="all-reservation-data">
                                {if $appointments|@count > 0}
                                    {foreach $appointments as $appointment}
                                        <tr class="text-center">
                                            <td><b>{$appointment->customer['cVorname']}</td>
                                            <td><b>{$appointment->customer['cMail']}</td>
                                            <td><b>{$appointment->event['title_en']}</td>
                                            <td><b>{$appointment->event['title_de']}</td>
                                            <td><b>{$appointment->event['description_en']}</td>
                                            <td><b>{$appointment->event['description_de']}</td>
                                            <td><b>{$appointment->status}</td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    <tr>
                                        <td class='text-center' id='npApiMessage' colspan="13">there is no data here</td>
                                    </tr>
                                {/if}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        #error-message-system,
        #discount-column {
            display: none;
        }

        #loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(255, 255, 255, 1);
            z-index: 20000;
            display: none;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #gift-details input:not(input.form-control.data),
        #gift-details select {
            width: 100%;
        }
    </style>
{/block}

</style>
<div id="loading">
    <div>
        <img src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/585d0331234507.564a1d239ac5e.gif" />
    </div>
    {if $smarty.session.kSprache === 1}
        <p>Loading . . . </p>
    {/if}
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.min.js"
    integrity="sha512-odNmoc1XJy5x1TMVMdC7EMs3IVdItLPlCeL5vSUPN2llYKMJ2eByTTAIiiuqLg+GdNr9hF6z81p27DArRFKT7A=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    jQuery(($) => {
        $('.attachment input[type="file"]')
            .on('change', (event) => {
                let el = $(event.target).closest('.attachment').find('.btn-file');

                el
                    .find('.btn-file__actions__item')
                    .css({
                        'padding': '135px 277px'
                    });

                el
                    .find('.btn-file__preview')
                    .css({
                        'background-image': 'url(' + window.URL.createObjectURL(event.target.files[0]) +
                            ')'
                    });
            });
    });
</script>