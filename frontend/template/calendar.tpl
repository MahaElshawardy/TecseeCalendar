{container fluid=$Link->getIsFluid()}

<!-- start up for event -->
<div class="up-for-all">
    {$jtl_token}
    <!-- start events -->
    <div class="all-events" language-data="{$smarty.session.kSprache}">
        <div class="maybe-scroll" style="direction: rtl; height: 100%; overflow-y: auto;">
            <div style="direction: ltr;">
                {if (isset($events)) && (count($events) > 0)}
                    {foreach from=$events item=event}

                        <div class="may-be-up">
                            <div class="event-box">
                                <div data-event='{$event|@json_encode}' class='click-on-box-to-show'>
                                    <div class="up-for-img-date">
                                        <div class="date"><span>{$event->start_day}</span> <span>{$event->start_month}</span>
                                        </div>
                                        <img src="{$event->image}" alt="" />
                                    </div>

                                    <div class="title-location">
                                        <div class="up-for-not-location">
                                            <h2>{$event->title}</h2>
                                            <p class="try-not-override">
                                                {$event->description}
                                            </p>
                                        </div>
                                        <p class="location">
                                            <i class="fas fa-map-marker-alt"></i> {$event->location}
                                        </p>
                                    </div>
                                </div>
                                <div class="icons">
                                    <a href='{$event->facebook_url}' class="facebookh"><i class="fab fa-facebook-f facebook" title="facebook"></i></a>
                                    <a href='{$event->twitter_url}' class="instagramh"><i class="fab fa-instagram instagram" title="twitter"></i></a>
                                    {if $smarty.session.kSprache === 1}
                                        <i data-event='{$event|@json_encode}'
                                            class="fa fa-eye click-to-show custom-icon-test" title="mehr Details"></i>
                                    {else}
                                        <i data-event='{$event|@json_encode}'
                                            class="fa fa-eye click-to-show custom-icon-test" title="more details"></i>
                                    {/if}
                                </div>
                            </div>

                            <div class='only-on-small-screen' style="padding: 15px; background-color: white;">

                                <hr>
                                </hr>

                                <span class="fas fa-times-circle close-x remove-with-show"></span>

                                <p style="font-size: 18px;">
                                    {$event->description}
                                </p>

                                <ul style="list-style: inside; font-size:16px">
                                    <li>{$interface.StartDate}: {$event->start_date}</li>
                                    <li>{$interface.EndDate}: {$event->end_date}</li>
                                    <li>{$interface.StartTime}: {$event->start_time}</li>
                                    <li>{$interface.EndTime}: {$event->end_time}</li>
                                </ul>

                                <div class="more-icons" style="display: flex;column-gap: 30px;">
                                    <div><i style="margin-right: 5px;" class="far fa-clock"></i>{$event->duration}</div>
                                    <div>
                                        <a href=""><i class="fas fa-map-marked-alt"
                                                style="margin-right: 5px;"></i>{$event->location}
                                        </a>
                                    </div>
                                </div>
                                {$jtl_token}
                                <div class="container1">
                                    <button class="reservation btn" reservation-id="{$event->id}" type="submit">
                                        {$interface.ReservationButton}</button>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {/if}
            </div>
        </div>
    </div>

    <!-- start description -->
    <div class="events-description" id="events-description">
        <h2 class="heading-for-events">{$interface.Subject}</h2>

        <div class="all-details" id="all-details">
            <span id="close-x" class="fas fa-times-circle close-x remove-with-show"></span>

            <div id="all-details-inside">

                <p class='only-center'>{$interface.DetailSubject}</p>
            </div>
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

    <!-- end up for event -->
{/container}