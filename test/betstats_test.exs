defmodule BetstatsTest do
  use ExUnit.Case

  test "Victii parse" do
    response = %HTTPoison.Response{
      body: """
      <!doctype html><html lang="en"><head><meta charset="utf-8" /><link rel="icon" href="/favicon.ico" /><meta name="viewport" content="width=device-width,initial-scale=1" /><meta name="theme-color" content="#000000" /><meta name="twitter:card" content="summary" /><meta name="twitter:site" content="@_victti" /><meta name="twitter:creator" content="@_victti" /><meta property="og:title" content="LoLPros BR - Bootcamp" /><meta name="description" content="Quer procurar um jogador e não encontra em lugar nenhum as contas deles? Já sabe onde procurar!" /><link rel="apple-touch-icon" href="/logo192.png" /><link rel="manifest" href="/manifest.json" /><title>Victor Cesar</title><script defer="defer" src="/static/js/main.b9cbe3c4.js"></script><link href="/static/css/main.117be9b9.css" rel="stylesheet"></head><body><noscript>You need to enable JavaScript to run this app.</noscript><div id="root"></div></body></html>
      """
    }

    assert Betstats.VictiiParser.parse(response) == []

    response = %HTTPoison.Response{
      body: """
      <html lang="en"><head><meta charset="utf-8"><link rel="icon" href="/favicon.ico"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="theme-color" content="#000000"><meta name="twitter:card" content="summary"><meta name="twitter:site" content="@_victti"><meta name="twitter:creator" content="@_victti"><meta property="og:title" content="LoLPros BR - Bootcamp"><meta name="description" content="Quer procurar um jogador e não encontra em lugar nenhum as contas deles? Já sabe onde procurar!"><link rel="apple-touch-icon" href="/logo192.png"><link rel="manifest" href="/manifest.json"><title>Victor Cesar</title><script defer="defer" src="/static/js/main.b9cbe3c4.js"></script><link href="/static/css/main.117be9b9.css" rel="stylesheet"><style type="text/css">.indiana-scroll-container {
        overflow: auto; }
        .indiana-scroll-container--dragging {
          scroll-behavior: auto !important; }
          .indiana-scroll-container--dragging > * {
            pointer-events: none;
            cursor: -webkit-grab;
            cursor: grab; }
        .indiana-scroll-container--hide-scrollbars {
          overflow: hidden;
          overflow: -moz-scrollbars-none;
          -ms-overflow-style: none;
          scrollbar-width: none; }
          .indiana-scroll-container--hide-scrollbars::-webkit-scrollbar {
            display: none !important;
            height: 0 !important;
            width: 0 !important;
            background: transparent !important;
            -webkit-appearance: none !important; }
        .indiana-scroll-container--native-scroll {
          overflow: auto; }

      .indiana-dragging {
        cursor: -webkit-grab;
        cursor: grab; }
      </style></head><body style="overflow: unset;"><noscript>You need to enable JavaScript to run this app.</noscript><div id="root"><nav class="navigation is-sticky null"><button class="hamburger"><svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="white"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg></button><div class="navigation-menu"><ul><li><a href="/">Início</a></li><li><a href="/lolpros/br">LoLPros</a></li><li><a href="/bootcamp">Bootcamp 2023.2</a></li></ul></div></nav><div class="div-content bet" data-v-963223af=""><div class="div-content-2" data-v-963223af=""><div class="wrap-table" data-v-963223af=""><div class="table" data-v-963223af=""><div class="row header" data-v-963223af=""><div class="cell" data-v-963223af="">Time</div><div class="cell" data-v-963223af="">Jogos</div><div class="cell" data-v-963223af="">Winrate</div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Winrate Blue</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 134.825px;" data-v-963223af="" id=":r0:" role="tooltip"><div class="relative z-20">Porcentagem de vitória no lado azul</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 116px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Winrate Red</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 187.575px;" data-v-963223af="" id=":r2:" role="tooltip"><div class="relative z-20">Porcentagem de vitória no lado vermelho</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 130.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Tempo</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 319.067px;" data-v-963223af="" id=":r4:" role="tooltip"><div class="relative z-20">Média de Tempo</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 62.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Abate</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 280.917px;" data-v-963223af="" id=":r6:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega First Blood</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 157px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Larva</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 306.883px;" data-v-963223af="" id=":r8:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega a primeira Vastilarva</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 183.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Arauto</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 396.358px;" data-v-963223af="" id=":ra:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega o Arauto</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 150px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Torre</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 432.725px;" data-v-963223af="" id=":rc:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega a primeira torre</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 168.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Dragão</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 480.583px;" data-v-963223af="" id=":re:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega o primeiro Dragão</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 177px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">1° Barão</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 542.55px;" data-v-963223af="" id=":rg:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que o time pega o primeiro Barão</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 173px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Ouro</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 657.325px;" data-v-963223af="" id=":ri:" role="tooltip"><div class="relative z-20">Média de Ouro do time por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 112.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Abates</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 710.1px;" data-v-963223af="" id=":rk:" role="tooltip"><div class="relative z-20">Média de Abates do time por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 117.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Mortes</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 770.075px;" data-v-963223af="" id=":rm:" role="tooltip"><div class="relative z-20">Média de Mortes do time por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 118px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Torres</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 786.425px;" data-v-963223af="" id=":ro:" role="tooltip"><div class="relative z-20">Média de Torres do destruídas pelo time por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 160px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Ouro</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 891.325px;" data-v-963223af="" id=":rq:" role="tooltip"><div class="relative z-20">Média do Total de Ouro por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 114.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Abates</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 947.85px;" data-v-963223af="" id=":rs:" role="tooltip"><div class="relative z-20">Média do Total de Abates por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 119.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Larvas</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 995.817px;" data-v-963223af="" id=":ru:" role="tooltip"><div class="relative z-20">Média do Total de Vastilarvas por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 131px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Torres</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1066.16px;" data-v-963223af="" id=":r10:" role="tooltip"><div class="relative z-20">Média do Total de Torres por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 118px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Dragões</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1123.5px;" data-v-963223af="" id=":r12:" role="tooltip"><div class="relative z-20">Média do Total de Dragões por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 123.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Total Barões</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1192.47px;" data-v-963223af="" id=":r14:" role="tooltip"><div class="relative z-20">Média do Total de Barões por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 119.5px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Torre &gt; 11.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1047px;" data-v-963223af="" id=":r16:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que caem mais de 11.5 torres por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 319.825px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Torre &gt; 12.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1046px;" data-v-963223af="" id=":r18:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que caem mais de 12.5 torres por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 370.575px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Drag &gt; 4.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1031px;" data-v-963223af="" id=":r1a:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que abatem mais de 4.5 dragões por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 401px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Drag &gt; 5.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1031px;" data-v-963223af="" id=":r1c:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que abatem mais de 5.5 dragões por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 401px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Barão &gt; 1.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1038px;" data-v-963223af="" id=":r1e:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que abatem mais de 1.5 barões por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 394px;">&nbsp;</div></div></div><div class="cell" data-v-963223af=""><div class="w-fit" data-testid="flowbite-tooltip-target">Inib &gt; 1.5</div><div data-testid="flowbite-tooltip" tabindex="-1" class="absolute inline-block z-10 rounded-lg py-2 px-3 text-sm font-medium shadow-sm transition-opacity duration-300 invisible opacity-0 bg-gray-900 text-white dark:bg-gray-700" style="position: absolute; top: 46px; left: 1007px;" data-v-963223af="" id=":r1g:" role="tooltip"><div class="relative z-20">Porcentagem de vezes que destroem mais de 1.5 inibidores por partida</div><div class="absolute z-10 h-2 w-2 rotate-45 bg-gray-900 dark:bg-gray-700" data-testid="flowbite-tooltip-arrow" style="bottom: -4px; left: 425px;">&nbsp;</div></div></div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">FUR</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">34:37</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">60.96K</div><div class="cell" data-v-963223af="">12.57</div><div class="cell" data-v-963223af="">15.5</div><div class="cell" data-v-963223af="">5.07</div><div class="cell" data-v-963223af="">125.17K</div><div class="cell" data-v-963223af="">28.21</div><div class="cell" data-v-963223af="">4.43</div><div class="cell" data-v-963223af="">12.57</div><div class="cell" data-v-963223af="">5.14</div><div class="cell" data-v-963223af="">1.79</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">50.0%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">FX</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">31:48</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">55.9K</div><div class="cell" data-v-963223af="">10.86</div><div class="cell" data-v-963223af="">14.29</div><div class="cell" data-v-963223af="">5.5</div><div class="cell" data-v-963223af="">115.18K</div><div class="cell" data-v-963223af="">25.21</div><div class="cell" data-v-963223af="">4.57</div><div class="cell" data-v-963223af="">13</div><div class="cell" data-v-963223af="">4.71</div><div class="cell" data-v-963223af="">1.57</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">78.6%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">ITZ</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">7.1%</div><div class="cell" data-v-963223af="">14.3%</div><div class="cell" data-v-963223af="">0.0%</div><div class="cell" data-v-963223af="">34:00</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">55.39K</div><div class="cell" data-v-963223af="">8.57</div><div class="cell" data-v-963223af="">17.71</div><div class="cell" data-v-963223af="">3.14</div><div class="cell" data-v-963223af="">120.49K</div><div class="cell" data-v-963223af="">26.36</div><div class="cell" data-v-963223af="">5.21</div><div class="cell" data-v-963223af="">12.21</div><div class="cell" data-v-963223af="">5</div><div class="cell" data-v-963223af="">1.79</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">50.0%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">KBM</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">33:10</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">14.3%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">60.08K</div><div class="cell" data-v-963223af="">13.5</div><div class="cell" data-v-963223af="">11.21</div><div class="cell" data-v-963223af="">6.43</div><div class="cell" data-v-963223af="">119.32K</div><div class="cell" data-v-963223af="">24.71</div><div class="cell" data-v-963223af="">5.57</div><div class="cell" data-v-963223af="">13</div><div class="cell" data-v-963223af="">5.07</div><div class="cell" data-v-963223af="">1.5</div><div class="cell" data-v-963223af="">85.7%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">64.3%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">LBR</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">32:38</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">58.91K</div><div class="cell" data-v-963223af="">11.57</div><div class="cell" data-v-963223af="">14.21</div><div class="cell" data-v-963223af="">5.79</div><div class="cell" data-v-963223af="">117.5K</div><div class="cell" data-v-963223af="">25.79</div><div class="cell" data-v-963223af="">4.29</div><div class="cell" data-v-963223af="">11.57</div><div class="cell" data-v-963223af="">4.64</div><div class="cell" data-v-963223af="">1.64</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">35.7%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">LLL</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">100.0%</div><div class="cell" data-v-963223af="">37.5%</div><div class="cell" data-v-963223af="">32:49</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">60.69K</div><div class="cell" data-v-963223af="">14.5</div><div class="cell" data-v-963223af="">13.5</div><div class="cell" data-v-963223af="">7.21</div><div class="cell" data-v-963223af="">119.4K</div><div class="cell" data-v-963223af="">28.07</div><div class="cell" data-v-963223af="">5</div><div class="cell" data-v-963223af="">12.5</div><div class="cell" data-v-963223af="">4.79</div><div class="cell" data-v-963223af="">1.43</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">57.1%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">LOS</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">37.5%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">35:46</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">63.22K</div><div class="cell" data-v-963223af="">13.29</div><div class="cell" data-v-963223af="">13.14</div><div class="cell" data-v-963223af="">5.29</div><div class="cell" data-v-963223af="">129.07K</div><div class="cell" data-v-963223af="">26.43</div><div class="cell" data-v-963223af="">4.5</div><div class="cell" data-v-963223af="">12.21</div><div class="cell" data-v-963223af="">5.5</div><div class="cell" data-v-963223af="">1.93</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">85.7%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">50.0%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">PNG</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">83.3%</div><div class="cell" data-v-963223af="">62.5%</div><div class="cell" data-v-963223af="">33:14</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">62.9K</div><div class="cell" data-v-963223af="">16.36</div><div class="cell" data-v-963223af="">10.64</div><div class="cell" data-v-963223af="">7.57</div><div class="cell" data-v-963223af="">120.28K</div><div class="cell" data-v-963223af="">27.07</div><div class="cell" data-v-963223af="">4.57</div><div class="cell" data-v-963223af="">12.07</div><div class="cell" data-v-963223af="">4.86</div><div class="cell" data-v-963223af="">1.64</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">35.7%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">35.7%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">RED</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">87.5%</div><div class="cell" data-v-963223af="">33.3%</div><div class="cell" data-v-963223af="">36:20</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">66.75K</div><div class="cell" data-v-963223af="">15.79</div><div class="cell" data-v-963223af="">12.71</div><div class="cell" data-v-963223af="">7.93</div><div class="cell" data-v-963223af="">130.27K</div><div class="cell" data-v-963223af="">28.5</div><div class="cell" data-v-963223af="">5.14</div><div class="cell" data-v-963223af="">13.21</div><div class="cell" data-v-963223af="">5.43</div><div class="cell" data-v-963223af="">1.71</div><div class="cell" data-v-963223af="">78.6%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">78.6%</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">50.0%</div><div class="cell" data-v-963223af="">57.1%</div></div><div class="row" data-v-963223af=""><div class="cell" data-v-963223af="">VKS</div><div class="cell" data-v-963223af="">14</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">85.7%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">30:16</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">28.6%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">64.3%</div><div class="cell" data-v-963223af="">57.1%</div><div class="cell" data-v-963223af="">71.4%</div><div class="cell" data-v-963223af="">58.28K</div><div class="cell" data-v-963223af="">15.5</div><div class="cell" data-v-963223af="">10.21</div><div class="cell" data-v-963223af="">8</div><div class="cell" data-v-963223af="">109.5K</div><div class="cell" data-v-963223af="">25.93</div><div class="cell" data-v-963223af="">4.71</div><div class="cell" data-v-963223af="">11.5</div><div class="cell" data-v-963223af="">4.14</div><div class="cell" data-v-963223af="">1.14</div><div class="cell" data-v-963223af="">42.9%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">14.3%</div><div class="cell" data-v-963223af="">21.4%</div><div class="cell" data-v-963223af="">64.3%</div></div></div></div></div></div></div></body></html>
      """
    }

    assert Betstats.VictiiParser.parse(response) == [
             %{
               baron_1_5:
                 "Barão > 1.5Porcentagem de vezes que abatem mais de 1.5 barões por partida ",
               deaths: "MortesMédia de Mortes do time por partida ",
               drag_4_5:
                 "Drag > 4.5Porcentagem de vezes que abatem mais de 4.5 dragões por partida ",
               drag_5_5:
                 "Drag > 5.5Porcentagem de vezes que abatem mais de 5.5 dragões por partida ",
               first_baron: "1° BarãoPorcentagem de vezes que o time pega o primeiro Barão ",
               first_blood: "1° AbatePorcentagem de vezes que o time pega First Blood ",
               first_dragon: "1° DragãoPorcentagem de vezes que o time pega o primeiro Dragão ",
               first_harold: "1° ArautoPorcentagem de vezes que o time pega o Arauto ",
               first_lava: "1° LarvaPorcentagem de vezes que o time pega a primeira Vastilarva ",
               first_tower: "1° TorrePorcentagem de vezes que o time pega a primeira torre ",
               games: "Jogos",
               gold: "OuroMédia de Ouro do time por partida ",
               inibitor:
                 "Inib > 1.5Porcentagem de vezes que destroem mais de 1.5 inibidores por partida ",
               kills: "AbatesMédia de Abates do time por partida ",
               match_time: "TempoMédia de Tempo ",
               team: "Time",
               total_barons: "Total BarõesMédia do Total de Barões por partida ",
               total_dragons: "Total DragõesMédia do Total de Dragões por partida ",
               total_gold: "Total OuroMédia do Total de Ouro por partida ",
               total_kills: "Total AbatesMédia do Total de Abates por partida ",
               total_larvas: "Total LarvasMédia do Total de Vastilarvas por partida ",
               total_towers: "Total TorresMédia do Total de Torres por partida ",
               tower_11_5:
                 "Torre > 11.5Porcentagem de vezes que caem mais de 11.5 torres por partida ",
               tower_12_5:
                 "Torre > 12.5Porcentagem de vezes que caem mais de 12.5 torres por partida ",
               towers: "TorresMédia de Torres do destruídas pelo time por partida ",
               winrate: "Winrate",
               winrate_blue: "Winrate BluePorcentagem de vitória no lado azul ",
               winrate_red: "Winrate RedPorcentagem de vitória no lado vermelho "
             },
             %{
               baron_1_5: "64.3%",
               deaths: "15.5",
               drag_4_5: "57.1%",
               drag_5_5: "35.7%",
               first_baron: "42.9%",
               first_blood: "57.1%",
               first_dragon: "57.1%",
               first_harold: "28.6%",
               first_lava: "28.6%",
               first_tower: "57.1%",
               games: "14",
               gold: "60.96K",
               inibitor: "50.0%",
               kills: "12.57",
               match_time: "34:37",
               team: "FUR",
               total_barons: "1.79",
               total_dragons: "5.14",
               total_gold: "125.17K",
               total_kills: "28.21",
               total_larvas: "4.43",
               total_towers: "12.57",
               tower_11_5: "57.1%",
               tower_12_5: "50.0%",
               towers: "5.07",
               winrate: "28.6%",
               winrate_blue: "28.6%",
               winrate_red: "28.6%"
             },
             %{
               baron_1_5: "50.0%",
               deaths: "14.29",
               drag_4_5: "50.0%",
               drag_5_5: "21.4%",
               first_baron: "35.7%",
               first_blood: "42.9%",
               first_dragon: "50.0%",
               first_harold: "71.4%",
               first_lava: "50.0%",
               first_tower: "35.7%",
               games: "14",
               gold: "55.9K",
               inibitor: "78.6%",
               kills: "10.86",
               match_time: "31:48",
               team: "FX",
               total_barons: "1.57",
               total_dragons: "4.71",
               total_gold: "115.18K",
               total_kills: "25.21",
               total_larvas: "4.57",
               total_towers: "13",
               tower_11_5: "71.4%",
               tower_12_5: "50.0%",
               towers: "5.5",
               winrate: "35.7%",
               winrate_blue: "28.6%",
               winrate_red: "42.9%"
             },
             %{
               baron_1_5: "50.0%",
               deaths: "17.71",
               drag_4_5: "64.3%",
               drag_5_5: "28.6%",
               first_baron: "35.7%",
               first_blood: "35.7%",
               first_dragon: "50.0%",
               first_harold: "64.3%",
               first_lava: "50.0%",
               first_tower: "21.4%",
               games: "14",
               gold: "55.39K",
               inibitor: "50.0%",
               kills: "8.57",
               match_time: "34:00",
               team: "ITZ",
               total_barons: "1.79",
               total_dragons: "5",
               total_gold: "120.49K",
               total_kills: "26.36",
               total_larvas: "5.21",
               total_towers: "12.21",
               tower_11_5: "64.3%",
               tower_12_5: "35.7%",
               towers: "3.14",
               winrate: "7.1%",
               winrate_blue: "14.3%",
               winrate_red: "0.0%"
             },
             %{
               baron_1_5: "42.9%",
               deaths: "11.21",
               drag_4_5: "57.1%",
               drag_5_5: "42.9%",
               first_baron: "42.9%",
               first_blood: "57.1%",
               first_dragon: "64.3%",
               first_harold: "14.3%",
               first_lava: "57.1%",
               first_tower: "64.3%",
               games: "14",
               gold: "60.08K",
               inibitor: "64.3%",
               kills: "13.5",
               match_time: "33:10",
               team: "KBM",
               total_barons: "1.5",
               total_dragons: "5.07",
               total_gold: "119.32K",
               total_kills: "24.71",
               total_larvas: "5.57",
               total_towers: "13",
               tower_11_5: "85.7%",
               tower_12_5: "64.3%",
               towers: "6.43",
               winrate: "57.1%",
               winrate_blue: "57.1%",
               winrate_red: "57.1%"
             },
             %{
               baron_1_5: "50.0%",
               deaths: "14.21",
               drag_4_5: "42.9%",
               drag_5_5: "21.4%",
               first_baron: "57.1%",
               first_blood: "28.6%",
               first_dragon: "21.4%",
               first_harold: "42.9%",
               first_lava: "57.1%",
               first_tower: "28.6%",
               games: "14",
               gold: "58.91K",
               inibitor: "35.7%",
               kills: "11.57",
               match_time: "32:38",
               team: "LBR",
               total_barons: "1.64",
               total_dragons: "4.64",
               total_gold: "117.5K",
               total_kills: "25.79",
               total_larvas: "4.29",
               total_towers: "11.57",
               tower_11_5: "42.9%",
               tower_12_5: "21.4%",
               towers: "5.79",
               winrate: "57.1%",
               winrate_blue: "71.4%",
               winrate_red: "42.9%"
             },
             %{
               baron_1_5: "35.7%",
               deaths: "13.5",
               drag_4_5: "42.9%",
               drag_5_5: "28.6%",
               first_baron: "50.0%",
               first_blood: "35.7%",
               first_dragon: "64.3%",
               first_harold: "64.3%",
               first_lava: "57.1%",
               first_tower: "50.0%",
               games: "14",
               gold: "60.69K",
               inibitor: "57.1%",
               kills: "14.5",
               match_time: "32:49",
               team: "LLL",
               total_barons: "1.43",
               total_dragons: "4.79",
               total_gold: "119.4K",
               total_kills: "28.07",
               total_larvas: "5",
               total_towers: "12.5",
               tower_11_5: "57.1%",
               tower_12_5: "42.9%",
               towers: "7.21",
               winrate: "64.3%",
               winrate_blue: "100.0%",
               winrate_red: "37.5%"
             },
             %{
               baron_1_5: "57.1%",
               deaths: "13.14",
               drag_4_5: "85.7%",
               drag_5_5: "50.0%",
               first_baron: "35.7%",
               first_blood: "64.3%",
               first_dragon: "35.7%",
               first_harold: "50.0%",
               first_lava: "42.9%",
               first_tower: "42.9%",
               games: "14",
               gold: "63.22K",
               inibitor: "50.0%",
               kills: "13.29",
               match_time: "35:46",
               team: "LOS",
               total_barons: "1.93",
               total_dragons: "5.5",
               total_gold: "129.07K",
               total_kills: "26.43",
               total_larvas: "4.5",
               total_towers: "12.21",
               tower_11_5: "64.3%",
               tower_12_5: "28.6%",
               towers: "5.29",
               winrate: "42.9%",
               winrate_blue: "37.5%",
               winrate_red: "50.0%"
             },
             %{
               baron_1_5: "50.0%",
               deaths: "10.64",
               drag_4_5: "57.1%",
               drag_5_5: "28.6%",
               first_baron: "71.4%",
               first_blood: "71.4%",
               first_dragon: "35.7%",
               first_harold: "28.6%",
               first_lava: "71.4%",
               first_tower: "64.3%",
               games: "14",
               gold: "62.9K",
               inibitor: "35.7%",
               kills: "16.36",
               match_time: "33:14",
               team: "PNG",
               total_barons: "1.64",
               total_dragons: "4.86",
               total_gold: "120.28K",
               total_kills: "27.07",
               total_larvas: "4.57",
               total_towers: "12.07",
               tower_11_5: "64.3%",
               tower_12_5: "35.7%",
               towers: "7.57",
               winrate: "71.4%",
               winrate_blue: "83.3%",
               winrate_red: "62.5%"
             },
             %{
               baron_1_5: "50.0%",
               deaths: "12.71",
               drag_4_5: "78.6%",
               drag_5_5: "42.9%",
               first_baron: "50.0%",
               first_blood: "64.3%",
               first_dragon: "64.3%",
               first_harold: "50.0%",
               first_lava: "50.0%",
               first_tower: "71.4%",
               games: "14",
               gold: "66.75K",
               inibitor: "57.1%",
               kills: "15.79",
               match_time: "36:20",
               team: "RED",
               total_barons: "1.71",
               total_dragons: "5.43",
               total_gold: "130.27K",
               total_kills: "28.5",
               total_larvas: "5.14",
               total_towers: "13.21",
               tower_11_5: "78.6%",
               tower_12_5: "50.0%",
               towers: "7.93",
               winrate: "64.3%",
               winrate_blue: "87.5%",
               winrate_red: "33.3%"
             },
             %{
               baron_1_5: "21.4%",
               deaths: "10.21",
               drag_4_5: "21.4%",
               drag_5_5: "14.3%",
               first_baron: "71.4%",
               first_blood: "42.9%",
               first_dragon: "57.1%",
               first_harold: "71.4%",
               first_lava: "28.6%",
               first_tower: "64.3%",
               games: "14",
               gold: "58.28K",
               inibitor: "64.3%",
               kills: "15.5",
               match_time: "30:16",
               team: "VKS",
               total_barons: "1.14",
               total_dragons: "4.14",
               total_gold: "109.5K",
               total_kills: "25.93",
               total_larvas: "4.71",
               total_towers: "11.5",
               tower_11_5: "42.9%",
               tower_12_5: "21.4%",
               towers: "8",
               winrate: "71.4%",
               winrate_blue: "85.7%",
               winrate_red: "57.1%"
             }
           ]
  end

  test "LolEsports Parse" do
  end
end
