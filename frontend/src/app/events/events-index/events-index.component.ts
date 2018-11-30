import { Component,ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Ng4LoadingSpinnerService } from 'ng4-loading-spinner';
import { NotificationService } from './../../shared';
import { EventService } from "./../event.service";


@Component({
  selector: 'app-events-index',
  templateUrl: './events-index.component.html',
  styleUrls: ['./events-index.component.css']
})
export class EventsIndexComponent implements OnInit {
  @ViewChild('EventImageModal') EventImageModal: ModalDirective;
  p: number = 1;
  events = [];
  errMesg: any;
  totalRecords = 0;
  pageSize = 5;
  eventImage = '';

  constructor(
    private spinnerService: Ng4LoadingSpinnerService, 
    private eventService: EventService,
    private notificationService: NotificationService
  ) { }

  ngOnInit() {
  	this.getEvent();
  }

  getEvent(){
    this.spinnerService.show();
    this.eventService.getEvents(1)
      .subscribe((response) => {
        this.events = response.data.data
        this.totalRecords =response.data.total
        this.spinnerService.hide();
      });
  }

  getPage($page)
  {
    this.spinnerService.show();
    this.eventService.getEvents($page)
      .subscribe((response) => {
        this.events = response.data.data
        this.totalRecords =response.data.total
        this.p = $page
        this.spinnerService.hide();
      });
  }

  deleteEvent($id){
    this.spinnerService.show();
    this.eventService.deleteEvent($id)
      .subscribe(data => {
        this.spinnerService.hide();
        this.notificationService.onSuccess('Successfully Deleted.')
        this.getEvent()
    })
  }

  viewImage(image){
    this.eventImage = image
    this.EventImageModal.show()
  }

}
