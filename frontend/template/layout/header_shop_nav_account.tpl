{block name='layout-header-shop-nav-account-logged-in' prepend}
    {include file="./Licenses/layout.tpl"}
    {if $smarty.session.kSprache === 1}
        {dropdownitem href="{$ShopURL}/mein-kalender" }
        {$interfaceCalendar.Calendar}
        {/dropdownitem}
    {else}
        {dropdownitem href="{$ShopURL}/my-calendar"}
        {$interfaceCalendar.Calendar}
        {/dropdownitem}
    {/if}
{/block}