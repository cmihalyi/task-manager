import Component from '@glimmer/component';
import { service } from '@ember/service';
import { LinkTo } from '@ember/routing';

export default class Nav extends Component {
  @service tasks;

  <template>
    <nav class="nav">
      <h1 class="nav-title">📝 Task Manager</h1>
      <div class="nav-links">
        <LinkTo @route="index" class="nav-link">
          Pending
          <span class="nav-badge-pending">
            {{this.tasks.pending.length}}
          </span>
        </LinkTo>
        <LinkTo @route="completed" class="nav-link">
          Completed
          <span class="nav-badge-completed">
            {{this.tasks.completed.length}}
          </span>
        </LinkTo>
      </div>
    </nav>
  </template>
}
