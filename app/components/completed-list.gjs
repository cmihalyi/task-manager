import Component from '@glimmer/component';
import { service } from '@ember/service';

export default class CompletedList extends Component {
  @service tasks;

  <template>
    <h2>Completed Tasks</h2>

    <ul class="task-list">
      {{#each this.tasks.completed as |task|}}
        <li class="task-list__item task-list__item--completed">
          {{task.title}}
        </li>
      {{else}}
        <li class="task-list__empty">
          Nothing completed yet — get to work! 💪
        </li>
      {{/each}}
    </ul>
  </template>
}
