import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

export default class TasksService extends Service {
  @tracked list = [];
  _nextId = 1;

  get pending() {
    return this.list.filter((t) => !t.done);
  }

  get completed() {
    return this.list.filter((t) => t.done);
  }

  addTask(title) {
    if (!title.trim()) return;
    this.list = [
      ...this.list,
      { id: this._nextId++, title: title.trim(), done: false },
    ];
  }

  toggleTask(id) {
    this.list = this.list.map((t) =>
      t.id === id ? { ...t, done: !t.done } : t
    );
  }

  deleteTask(id) {
    this.list = this.list.filter((t) => t.id !== id);
  }
}
