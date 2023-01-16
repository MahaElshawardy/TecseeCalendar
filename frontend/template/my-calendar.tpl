{block name='customer-appointments-page'}
    <div class="container customer-appointments-container" my-appointments-data-lang='{$smarty.session.kSprache}'
        id="customer-appointments-container" data-lang='{$smarty.session.kSprache}'>

        <h1>
            {if $smarty.session.kSprache === 1}
                Meine eingereichten Termine
            {else}
                My Submitted Appointments
            {/if}
        </h1>

        <div class="customer-appointments-boxes" id="customer-appointment-boxes-container">
            {if isset($appointments)}
                {foreach from=$appointments item=appointment}
                    <div class="customer-appointment-box">
                        <div class="customer-appointment-date">
                            {$appointment->title}
                        </div>

                        <div class="customer-appointment-info">
                            <p>
                                <span>
                                    start: {$appointment->start_time}
                                </span>
                            </p>
                            <p>
                                <span>
                                    End: {$appointment->end_time}
                                </span>
                            </p>
                            <p>
                                <span>
                                    Location: {$appointment->location}
                                </span>
                            </p>
                            <p>
                                <span>
                                    Status: {$appointment->status}
                                </span>
                            </p>
                        </div>

                        <div class="customer-appointment-status">
                            {if $appointment->status === 'cancelled'}
                                <h4 style="margin: 15px;
                                color: white;"> Canceled </h4>
                            {else}
                                <button class="delete" id="cancel" data-status="{$appointment->id}">
                                    Cancel
                                </button>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            {else}
                <h4> There is no data here </h4>
            {/if}
        </div>
    </div>

    {* modal *}

    <button type="button" hidden class="btn btn-info btn-lg" id="reservationButton" data-toggle="modal"
        data-target="#reservationModal"></button>

    <div class="modal fade" id="reservationModal" role="dialog" style="min-width: 100%;width: fit-content;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <i id="close-updated-modal" class="fas fa-xmark close" data-dismiss="modal" style="    transform: translate(20%, 30%);
                    background-color: unset;
                    color: red;">X</i>
                    <h4>Modal Title</h4>
                </div>
                <div id="modalstatus" class="modal-body ">

                </div>
            </div>
        </div>
    </div>
{/block}