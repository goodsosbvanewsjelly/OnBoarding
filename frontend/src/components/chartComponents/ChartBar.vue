<template>
  <input type="button" class="button" value="Graph👀" @click="flag = !flag" />
  <br />
  <div v-if="flag">
    <Bar :data="data" :options="options" ref="bb"></Bar>
  </div>
</template>

<script setup lang="ts">
import type { GuessItemInterface } from "@/interface";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";
import { computed, nextTick, onMounted, onUpdated, ref, watch } from "vue";
import { Bar } from "vue-chartjs";
import * as chartConfig from "../../charts/chartBar";

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

const data = ref<any>(chartConfig.data);
const options = ref<any>(chartConfig.options);
const flag = ref<boolean>(false);
const bb = ref<InstanceType<typeof Bar> | null>(null);

const props = defineProps<{
  guess_data: GuessItemInterface[];
}>();

options.value = {
  responsive: true,
  maintainAspectRatio: false,
};

function data_extraction(GuessItemInterface_data: GuessItemInterface[]) {
  let tmp_extraction_data = [];
  let tmp_extraction_label = [];

  for (const obj of GuessItemInterface_data) {
    tmp_extraction_data.push(obj.similarity);
    tmp_extraction_label.push(obj.word);
  }
  return {
    data: tmp_extraction_data,
    label: tmp_extraction_label,
  };
}

watch(
  () => props.guess_data.length,
  () => {
    console.log("watched");
    const extraction = data_extraction(props.guess_data);
    data.value.datasets[0].data = extraction.data;
    data.value.labels = extraction.label;

    flag.value = false;
    setTimeout(() => {
      flag.value = true;
    }, 10);
  }
);

// 나중에 안쓰는 방식으로 바꿔야함.
// onUpdated(() => {
//   init_data.value = props.guess_data;
//   console.log(init_data.value);

//   const extraction = data_extraction(props.guess_data);

//   data.value.datasets[0].data = extraction.data;
//   data.value.labels = extraction.label;
// });

// onMounted(() => {
//   console.log(props.guess_data);
//   data.value = chartConfig.data;
//   options.value = chartConfig.options;
// });

// watch(init_data.value as GuessItemInterface[], async (new_guess_data) => {
//   console.log(props.guess_data, new_guess_data);
//   const extraction = data_extraction(new_guess_data);

//   data.value.datasets[0].data = extraction.data;
//   data.value.labels = extraction.label;
// });
</script>

<style scoped>
.button {
  margin-bottom: 10px;
  padding-left: 0.4em;
}
</style>
