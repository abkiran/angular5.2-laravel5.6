import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {EventService} from "./../event.service";
import { Ng4LoadingSpinnerService } from 'ng4-loading-spinner';
import { NotificationService } from './../../shared';
@Component({
  selector: 'app-events-add',
  templateUrl: './events-add.component.html',
  styleUrls: ['./events-add.component.css']
})
export class EventsAddComponent implements OnInit {

  eventData = {isbn:'', title:'', author:'', description:'', image:''}
  message = ''
  selectFiles: File = null;
  
  constructor(
    private spinnerService: Ng4LoadingSpinnerService,
    private eventService: EventService, 
    private router: Router,
    private notificationService: NotificationService
  ) { }

  ngOnInit() {
  }

  onFileSelected(event)
  {
    this.selectFiles = <File>event.target.files[0]
  }

  addEvent() {
      this.spinnerService.show();
      let fd = new FormData();
      for(let key in this.eventData){
          fd.append(key, this.eventData[key])
      }
      if(this.selectFiles != null)
      {
         fd.append('image',this.selectFiles,this.selectFiles.name)
      }
      this.eventService.addEvents(fd)
      .subscribe((value) => {
        this.spinnerService.hide();
        this.notificationService.onSuccess('Successfully Added.')
        this.router.navigateByUrl('event');   
      });
  }

}
