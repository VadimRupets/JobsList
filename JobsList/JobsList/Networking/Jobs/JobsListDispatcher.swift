//
//  JobsListDispatcher.swift
//  JobsList
//
//  Created by Vadim Rupets on 5/21/19.
//  Copyright © 2019 Vadim Rupets. All rights reserved.
//

import Foundation

protocol JobsListDispatcherProtocol: Dispatcher where ResponseObject == JobsList, APIRequest == JobsListRequest { }

class JobsListDispatcher: JobsListDispatcherProtocol { }
