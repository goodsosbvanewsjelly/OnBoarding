<template>
  <tr v-if="word !== null">
    <td>{{ word.cnt }}</td>
    <td :class="{ highlight: is_highlighted === true }">{{ word.word }}</td>
    <td>{{ word.similarity.toFixed(2) }}</td>
    <td v-if="shouldShowBarGraph(word)">
      <BarGraph :value="Number.parseFloat(word.rank)" />
    </td>
    <td v-else-if="is_weird_word">
      <span class="weirdWord"
        >????<span class="tooltiptext"
          >이 단어는 사전에는 없지만, 데이터셋에 포함되어 있으며 1,000위
          이내입니다.</span
        ></span
      >
    </td>
    <td v-else>{{ word.rank }}</td>
  </tr>
</template>

<script setup lang="ts">
import BarGraph from "./BarGraph.vue";
import { computed, onUpdated, ref } from "vue";
import type { GuessItemInterface, SimilarityStoryInterface } from "@/interface";
const props = defineProps<{
  word: GuessItemInterface;
  is_highlighted: boolean;
  puzzle_number: number;
  similarity_story: SimilarityStoryInterface | null;
}>();

const is_weird_word = computed(() => {
  if (props.similarity_story !== null) {
    const similarity_story = props.similarity_story;

    if (
      props.similarity_story.rest * 100 <= props.word.similarity &&
      props.word.rank === "1000위 이상"
    ) {
      return true;
    }
  }
  return false;
});

function shouldShowBarGraph(word: GuessItemInterface) {
  return (
    word.rank !== "1000위 이상" && word.rank !== "정답!" && word.rank !== "정답"
  );
}
</script>

<style scoped>
.highlight {
  color: rgb(19, 92, 201);
  font-weight: bold;
}
</style>
