{block name='layout-header-top-bar-cms-pages' append}
    {include file="./Licenses/layout.tpl"}
    <li class="nav-item">
        {if $smarty.session.kSprache === 1}
            <a class="nav-link custom-partner-search" href="{$ShopURL}/Kalender">{$interfaceCalendar.NavAcount}</a>
        {else}
            <a class="nav-link custom-partner-search" href="{$ShopURL}/Calendar">{$interfaceCalendar.NavAcount}</a>
        {/if}
    </li>
{/block}