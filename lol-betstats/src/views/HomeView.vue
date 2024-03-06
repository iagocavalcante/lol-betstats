<template>
  <main>
    <section>
      <div class="matches">
        <h1>Partidas</h1>
        <p>{{ matches.length }}</p>
      </div>
      <div class="matches">
        <h2>Filtrar por data</h2>
        <div class="filter">
          <select @change="filterByDate($event.target.value)">
            <option v-for="date in datesOfMatches" :key="date" :value="date">{{ date }}</option>
          </select>
          <button @click="resetFilter()">Reset</button>
        </div>
      </div>
    </section>
    <div class="event" v-for="match in matches" :key="match.team1">
      <div class="event--league">
        <div class="league__name">{{ match.league }}</div>
        <div class="league__strategy">{{ match.best_of }}</div>
      </div>
      <div class="event--date">
        <p>{{ match.date }}</p>
      </div>
      <div class="event--match">
        <div class="event--match__teams">
          <div class="event--match__teams--team-1">
            <div class="event--match__teams--team-1__info">
              <img class="event--match__teams--team__info--logo" :src="match.team1.logo" alt="">
            </div>
            <div class="event--match__teams--stats">
              <div class="stats__games" v-for="stat in labelAndValue(match.date, 'team1')" :key="stat.team" :title="stat.tooltip">
                <span class="stats__games--label">
                  {{ stat.label }}
                </span>
                <span class="stats__games--value">
                  {{ stat.value }}
                </span>
              </div>
            </div>
          </div>
          <hr class="separator">
          <div class="event--match__teams--team-2">
            <div class="event--match__teams--team-2__info">
              <img class="event--match__teams--team__info--logo" :src="match.team2.logo" alt="">
            </div>
            <div class="event--match__teams--stats">
              <div class="stats__games" v-for="stat in labelAndValue(match.date, 'team2')" :key="stat.team">
                <span class="stats__games--label">
                  {{ stat.label }}
                </span>
                <span class="stats__games--value">
                  {{ stat.value }}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script setup>
import { ref, toRaw } from 'vue'
import Matches from '@/assets/merged_data.json'

const matches = ref(Matches)

const datesOfMatches = Matches.map((match) => match.date).filter((date, index, self) => self.indexOf(date) === index)

const resetFilter = () => {
  matches.value = Matches
}

const labelAndValue = (date, team) => {
  const match = matches.value.find((match) => match.date === date)
  if (!match || !match[team] || !match[team].stats) return []
  const match_find = toRaw(match)

  return [
    { label: 'Games', value: match_find[team].stats.games, tooltip: "Partidas jogadas" },
    { label: 'Winrate', value: match_find[team].stats.winrate, tooltip: "Winrate" },
    { label: 'Winrate blue side', value: match_find[team].stats.winrate_blue, tooltip: "Porcentagem de vitória no lado azul" },
    { label: 'Winrate red side', value: match_find[team].stats.winrate_red, tooltip: "Porcentagem de vitória no lado vermelho" },
    { label: 'Kills', value: match_find[team].stats.kills, tooltip: "Média de Abates do time por partida" },
    { label: 'Deaths', value: match_find[team].stats.deaths, tooltip: "Média de Mortes do time por partida" },
    { label: 'Gold', value: match_find[team].stats.gold, tooltip: "Média de Ouro do time por partida" },
    { label: 'Total Kills', value: match_find[team].stats.total_kills, tooltip: "Média do Total de Abates por partida" },
    { label: 'Total Gold', value: match_find[team].stats.total_gold, tooltip: "Média do Total de Ouro por partida" },
    { label: 'Total larvas', value: match_find[team].stats.total_larvas, tooltip: "Média do Total de Vastilarvas por partida" },
    { label: 'Total Towers', value: match_find[team].stats.total_towers, tooltip: "Média do Total de Torres por partida" },
    { label: 'Total Barons', value: match_find[team].stats.total_barons, tooltip: "Média do Total de Barões por partida" },
    { label: 'Total Dragons', value: match_find[team].stats.total_dragons, tooltip: "Médoa do Total de Dragões por partida" },
    { label: 'First Blood', value: match_find[team].stats.first_blood, tooltip: "Porcentagem de vezes que o time pega o primeiro abate" },
    { label: 'First Dragon', value: match_find[team].stats.first_dragon, tooltip: "Porcentagem de vezes que o time pega o primeiro dragão" },
    { label: 'First Harold', value: match_find[team].stats.first_harold, tooltip: "Porcentagem de vezes que o time pega o primeiro Heraldo" },
    { label: 'First Lava', value: match_find[team].stats.first_lava, tooltip: "Porcentagem de vezes que o time pega o primeiro Arauto" },
    { label: 'First Tower', value: match_find[team].stats.first_tower, tooltip: "Porcentagem de vezes que o time pega o primeiro Torre" },
    { label: 'First Baron', value: match_find[team].stats.first_baron, tooltip: "Porcentagem de vezes que o time pega o primeiro Barão" },
    { label: 'Inibitor', value: match_find[team].stats.inibitor, tooltip: "Porcentagem de vezes que destroem mais de 1.5 inibidores por partida" },
    { label: 'Tower 11.5', value: match_find[team].stats.tower_11_5, tooltip: "Porcentagem de vezes que caem mais de 11.5 torres por partida" },
    { label: 'Tower 12.5', value: match_find[team].stats.tower_12_5, tooltip: "Porcentagem de vezes que caem mais de 12.5 torres por partida" },
    { label: 'Drag 4.5', value: match_find[team].stats.drag_4_5, tooltip: "Porcentagem de vezes que abatem mais de 4.5 dragões por partida" },
    { label: 'Drag 5.5', value: match_find[team].stats.drag_5_5, tooltip: "Porcentagem de vezes que abatem mais de 5.5 dragões por partida" },
    { label: 'Match Time', value: match_find[team].stats.match_time, tooltip: "Média de tempo de partida" },
  ]
}

const filterByDate = (date) => {
  matches.value = Matches.filter((match) => match.date === date)
}

</script>

<style scoped>
.event {
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 1px solid #000;
  padding: 20px;
  margin: 20px 0;
  width: 80vw;
  background-color: rgba(63, 131, 248, .5);
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.event--date {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
}

.event--league {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.league__name {
  font-size: 1.5rem;
  font-weight: bold;
}

.league__strategy {
  font-size: 1.2rem;
  font-weight: bold;
}

.event--match {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.event--match__teams {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.event--match__teams--team-1 {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 20px;
  margin-right: 40px;
}

.event--match__teams--team-1__info {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.event--match__teams--team__info--logo {
  width: 100px;
  height: 100px;
}

.event--match__teams--team-2 {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 20px;
}

.event--match__teams--team-2__info {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.event--match__teams--stats {
  display: grid;
  grid-template-columns: repeat(10, 1fr);
  gap: 15px;
  margin-left: 20px;
}

.event--match__teams--stats div {
  margin: 0 5px;
}

.stats__games {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
}

.stats__games--label {
  font-weight: bold;
  font-size: .8rem;
}

.stats__games--value {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 10px;
  text-align: center;
}

.separator {
  width: 100%;
  border: 1px solid #000;
  margin-bottom: 20px;
}

.matches {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.filter {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  align-content: space-between;
  margin-bottom: 20px;
  margin: 8px;
}
</style>
