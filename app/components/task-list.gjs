import Component from '@glimmer/component';
import { service } from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

export default class TaskList extends Component {
  @service tasks;
  @tracked newTitle = '';

  @action
  updateTitle(event) {
    this.newTitle = event.target.value;
  }

  @action
  addTask(event) {
    event.preventDefault();
    this.tasks.addTask(this.newTitle);
    this.newTitle = '';
  }

  @action
  toggle(id) {
    this.tasks.toggleTask(id);
  }

  @action
  delete(id) {
    this.tasks.deleteTask(id);
  }

  <template>
    <h2>Pending Tasks</h2>

    <form class="task-form" {{on "submit" this.addTask}}>
      <label for="new-task" class="sr-only">New task title</label>
      <input
        id="new-task"
        class="task-form-input"
        type="text"
        placeholder="Add a new task..."
        value={{this.newTitle}}
        {{on "input" this.updateTitle}}
      />
      <button class="task-form-button" type="submit">
        Add
      </button>
    </form>

    <ul class="task-list">
      {{#each this.tasks.pending as |task|}}
        <li class="task-list-item">
          <span>{{task.title}}</span>
          <div class="task-list-actions">
            <button class="btn-done" type="button" {{on "click" (fn this.toggle task.id)}}>
              ✅ Done
            </button>
            <button class="btn-delete" type="button" {{on "click" (fn this.delete task.id)}}>
              🗑 Delete
            </button>
          </div>
        </li>
      {{else}}
        <li class="task-list-empty">
          No pending tasks — add one above!
        </li>
      {{/each}}
    </ul>
  </template>
}
