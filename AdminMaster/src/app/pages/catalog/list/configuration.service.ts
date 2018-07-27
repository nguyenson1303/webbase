import { Injectable } from '@angular/core';
import { Config } from 'ngx-easy-table/src/app/ngx-easy-table/model/config';
import { AppConstant } from '../../../config/appconstant';

@Injectable()
export class ConfigurationService {
  public static config: Config = {
    searchEnabled: false,
    headerEnabled: true,
    orderEnabled: false,
    globalSearchEnabled: false,
    paginationEnabled: true,
    exportEnabled: false,
    clickEvent: false,
    selectRow: false,
    selectCol: false,
    selectCell: false,
    rows: AppConstant.pageSizeDefault,
    additionalActions: false,
    serverPagination: false,
    isLoading: false,
    detailsTemplate: false,
    groupRows: false,
    paginationRangeEnabled: true,
    collapseAllRows: false,
    checkboxes: false,
    resizeColumn: false,
    fixedColumnWidth: false,
    horizontalScroll: false,
    draggable: false,
    logger: false,
    tableLayout: {
      style: 'normal',
      theme: 'light',
      borderless: false,
      hover: true,
      striped: false,
    }
  };
}
