<template>
  <main>
    <div class="event" v-for="match in  matches " :key="match.date">
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
              <h2>
                <span class="name">{{ match.team1.team }}</span>
              </h2>
              <img class="event--match__teams--team__info--logo" :src="match.team1.logo" alt="">
            </div>
            <div class="event--match__teams--stats">
              <div class="stats__games" v-for="stat in labelAndValue(match.date, 'team1')" :key="stat.team">
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
              <h2>
                <span class="name">{{ match.team2.team }}</span>
              </h2>
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

const labelAndValue = (date, team) => {
  const match = matches.value.find((match) => match.date === date)
  if (!match || !match[team] || !match[team].stats) return []
  const match_find = toRaw(match)
  console.log(match_find[team].stats)
  return [
    { label: 'Games', value: match_find[team].stats.games },
    { label: 'Winrate', value: match_find[team].stats.winrate },
    { label: 'Kills', value: match_find[team].stats.kills },
    { label: 'Deaths', value: match_find[team].stats.deaths },
    { label: 'Gold', value: match_find[team].stats.gold },
    { label: 'Total Kills', value: match_find[team].stats.total_kills },
    { label: 'Total Gold', value: match_find[team].stats.total_gold },
    { label: 'Total Towers', value: match_find[team].stats.total_towers },
    { label: 'Total Barons', value: match_find[team].stats.total_barons },
    { label: 'Total Dragons', value: match_find[team].stats.total_dragons },
    { label: 'First Blood', value: match_find[team].stats.first_blood },
    { label: 'First Dragon', value: match_find[team].stats.first_dragon },
    { label: 'First Harold', value: match_find[team].stats.first_harold },
    { label: 'First Lava', value: match_find[team].stats.first_lava },
    { label: 'First Tower', value: match_find[team].stats.first_tower },
    { label: 'First Baron', value: match_find[team].stats.first_baron },
    { label: 'Inibitor', value: match_find[team].stats.inibitor },
    { label: 'Tower 11.5', value: match_find[team].stats.tower_11_5 },
    { label: 'Tower 12.5', value: match_find[team].stats.tower_12_5 },
    { label: 'Drag 4.5', value: match_find[team].stats.drag_4_5 },
    { label: 'Drag 5.5', value: match_find[team].stats.drag_5_5 },
    { label: 'Match Time', value: match_find[team].stats.match_time }
  ]
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
  margin-top: 20px;
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
</style>
